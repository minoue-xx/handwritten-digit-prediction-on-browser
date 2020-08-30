% https://jp.mathworks.com/help/supportpkg/android/ref/digit-classification-using-hog-features-on-mnist-database.html?s_tid=srchtitle
% https://blogs.mathworks.com/loren/2015/08/04/artificial-neural-networks-for-beginners/
% https://jp.mathworks.com/help/stats/visualize-high-dimensional-data-using-t-sne.html?s_tid=srchtitle

imageFileName = 'train-images.idx3-ubyte';
labelFileName = 'train-labels.idx1-ubyte';
addpath(fullfile(matlabroot,'examples','stats')); % add to the path
[X,L] = processMNISTdata(imageFileName,labelFileName);
rmpath(fullfile(matlabroot,'examples','stats')); % remove from the path

%%
% [XTrain,YTrain,anglesTrain] = digitTrain4DArrayData;
YTrain = categorical(L);
classNames = categories(YTrain);
numClasses = numel(classNames);
numObservations = numel(YTrain);

tabulate(YTrain)

%%
% idx = 300;
% figure(1)
% contour(XTrain(:,:,1,idx));
% set(gca,'YDir','reverse');
% 
% a = XTrain(:,:,1,idx);
% se = strel('square',1);
% erodedBW = imerode(a,se);
% J = imadjust(erodedBW,[0 max(erodedBW(:))]);
% J = imbinarize(J,0.5);
% figure(2)
% contour(J);
% set(gca,'YDir','reverse');

%%
% XTrain2 = XTrain;
% se = strel('square',1);
% for ii=1:5000
%     a = XTrain(:,:,1,ii);
%     erodedBW = imerode(a,se);
%     J = imadjust(erodedBW,[0 max(erodedBW(:))]);
%     J = imbinarize(J,0.5);
%     XTrain2(:,:,1,ii) = J;
% end
%%
N = length(YTrain);                % number of samples in the dataset
outputs = dummyvar(YTrain);       % convert label into a dummy variable

% inputs = reshape(XTrain,28*28,5000);
inputs = X'/255;
% inputs = reshape(XTrain2,28*28,5000);
outputs = outputs';               % transpose dummy variable
%%
rng(1); 
x = inputs;
t = outputs;

% Choose a Training Function
% For a list of all training functions type: help nntrain
% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. Suitable in low memory situations.
trainFcn = 'trainscg';  % Scaled conjugate gradient backpropagation.

% Create a Pattern Recognition Network
hiddenLayerSize = 100;
net = patternnet(hiddenLayerSize, trainFcn);

% Setup Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;

% Train the Network
[net,tr] = train(net,x,t);

x = inputs(:,1);
net(x)

%%

% genFunction(net, 'digitPredictFcn');
x = inputs(:,2);
y2 = digitPredictFcn(x/255)
% edit digitPredictFcn