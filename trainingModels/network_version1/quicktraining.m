
%%
[XTrain,YTrain,anglesTrain] = digitTrain4DArrayData;
classNames = categories(YTrain);
numClasses = numel(classNames);
numObservations = numel(YTrain);

%%
N = length(YTrain);                % number of samples in the dataset
outputs = dummyvar(YTrain);       % convert label into a dummy variable
inputs = reshape(XTrain,28*28,5000);
outputs = outputs';               % transpose dummy variable
%%
rng(1); 

x = inputs;
t = outputs;

% Choose a Training Function
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

%%

% genFunction(net, 'digitPredictFcn');
% edit digitPredictFcn