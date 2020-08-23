# MATLAB �̃j���[�����l�b�g���u���E�U�œ�����: MATLAB > C++ > WebAssembly �̎����ϊ�
# 0. �͂��߂�


MATLAB ���u���E�U����������ʔ������Ȃ��̂Ȃ����Ȃ��E�E�Ǝv���Ă�����A




[TensorFlow.js��MNIST�w�K�σ��f����ǂݍ��݃u���E�U�Ŏ菑�������F��������](https://qiita.com/yukagil/items/ca84c4bfcb47ac53af99)




����ȑf���炵���L�������������̂ŁA�}�l�����Ă݂܂����B���̋L���ł� TensorFlow.js ��Web�u���E�U��ŏ�����������0\textasciitilde{}9�̂ǂꂩ��\�����Ă��܂����A���̗\�������� MATLAB �̃j���[�����l�b�g���g���Ă݂��A�Ƃ������b�B


  
# ���������


�R�[�h�����炩��F [GitHub: minoue-xx/handwritten-digit-prediction-on-browser](https://github.com/minoue-xx/handwritten-digit-prediction-on-browser)




���s�y�[�W�͂�����F[Github Pages: Hand-written Digit Prediction on Browser](https://minoue-xx.github.io/handwritten-digit-prediction-on-browser/)


  


�\�����x�͉������ł����A�����ł͂܂��������̂��A�A�ƒP���ȃl�b�g���[�N���w�K���� GitHub Pages �Ɏ�������܂ł̃X�e�b�v���������L���ł��B




![image_0.png](MATLAB2WebAssembly_images/image_0.png)


  
# WebAssembly �ϊ��H


[MATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript](https://qiita.com/eigs/items/68cdcec7b8d56a5b440f)




�ł� [fmincon �֐�](https://jp.mathworks.com/help/optim/ug/fmincon.html)���g�����œK�����u���E�U�������܂������A�������@���g���܂��B


  


[File Exchange](https://jp.mathworks.com/matlabcentral/fileexchange/) �Ɍ��J����Ă��� [Generate JavaScript Using MATLAB Coder](https://jp.mathworks.com/matlabcentral/fileexchange/69973-generate-javascript-using-matlab-coder) �Ƃ����c�[���ŁAMATLAB Coder ���g���� MATLAB ���� WebAssembly �ɕϊ����Ď������܂��B




![image_1.png](MATLAB2WebAssembly_images/image_1.png)




��{�I�ɂ� Generate JavaScript Using MATLAB Coder �ŗp�ӂ���Ă���  [���: Pass Data to a Library](https://viewer.mathworks.com/?viewer=live_code&url=https%3A%2F%2Fjp.mathworks.com%2Fmatlabcentral%2Fmlc-downloads%2Fdownloads%2Fbd0e1def-822e-40bc-8a7f-5842c7197c5e%2Fe7abd4d2-be59-4ad2-858e-3f1046727acf%2Ffiles%2Fexamples%2FcreateLibrary%2FPassingDataArray.mlx&embed=web) �̗���ɉ����č�Ƃ��Ă��܂��B


  
## ��

   -  MATLAB (R2019b Update 5) 
   -  Deep Learning Toolbox 
   -  MATLAB Coder 
   -  Image Processing Toolbox�i[montage �֐�](https://jp.mathworks.com/help/images/ref/montage.html) �ɂ��\���̂݁j 
   -  Statistics and Machine Learning Toolbox�i[tabulate �֐�](https://jp.mathworks.com/help/stats/tabulate.html) �ɂ��f�[�^���W�v�̂݁j 
   -  [File Exchange: Generate JavaScript Using MATLAB Coder](https://jp.mathworks.com/matlabcentral/fileexchange/69973-generate-javascript-using-matlab-coder) v2.0.2 
   -  [Emscripten Development Kit](https://emscripten.org/index.html) v1.39.1 

  
# 1. �c�[���̐ݒ�


��{�I�ɂ� [MATLAB -> C++ -> WebAssembly �̎����ϊ����g��������`�œK�� on JavaScript](https://qiita.com/eigs/items/68cdcec7b8d56a5b440f) �Ɠ����X�e�b�v�𓥂݂܂��B




File Exchange ���� [Generate JavaScript Using MATLAB Coder](https://jp.mathworks.com/matlabcentral/fileexchange/69973-generate-javascript-using-matlab-coder) ���C���X�g�[���B�܂��J�� `Setup.mlx` �ɏ]���� Emscripten Development Kit �̍ŐV�ł��C���X�g�[�����܂��B�l�b�g���[�N�t�H���_���Ƃ��܂������Ȃ������̂ŁA���[�J���ɃC���X�g�[�����������B


  
# 2. MATLAB Project �쐬


Generate JavaScript Using MATLAB Coder �ł� [MATLAB Project](https://jp.mathworks.com/help/matlab/projects.html) ���g�p���܂��B




��ƃt�H���_�i[trainingModels/generateWebAssembly](https://github.com/minoue-xx/handwritten-digit-prediction-on-browser/tree/master/trainingModels/generateWebAssembly)�j�Ɉړ����āA�ȉ������s�B�o�͌`���� Dynamic Libeary (dll) �ł��B


```matlab
proj = webcoder.setup.project("digitprediction","Directory",pwd,"OutputType",'dll');
```
  
# 3. MATLAB �֐��쐬


����`�œK�������{����֐� `digitPredictionFcn.m` �����܂��B�܂��͒P���ɉB��w���P�w�����́h�󂢁h�l�b�g���[�N�ł���Ă݂܂��B



   -  Step 1: �f�[�^�ǂݍ��� 
   -  Step 2: �w�K 
   -  Step 3: ���f���� MATLAB �֐��� 
   -  Step 4: �R�[�h�����p�ɔ��C�� 



![image_2.png](MATLAB2WebAssembly_images/image_2.png)




�w�K�X�e�b�v�͂�������Q�l�ɂ��܂���: [MathWorks Blog: Artificial Neural Networks for Beginners](https://blogs.mathworks.com/loren/2015/08/04/artificial-neural-networks-for-beginners/)


## Step 1: �f�[�^�ǂݍ���
```matlab
%% �T���v���f�[�^�ǂݍ��݁iDeep Learning Toolbox �ɓ����Ă���f�[�^�ł��j
[XTrain,YTrain,anglesTrain] = digitTrain4DArrayData;
classNames = categories(YTrain);
numClasses = numel(classNames);
numObservations = numel(YTrain);
whos XTrain
```
```
  Name         Size                      Bytes  Class     Attributes

  XTrain      28x28x1x5000            31360000  double              
```


28x28 �̃��m�N���摜�� 5000 �������Ă��܂��ˁB


```matlab
montage(XTrain(:,:,:,1:16))
```

![figure_0.png](MATLAB2WebAssembly_images/figure_0.png)



����ȉ摜�ł��B�ȉ��̒ʂ�e���x���i�����j�ɂ� 500 ���̉摜���p�ӂ���Ă��܂��B


```matlab
tabulate(YTrain)
```
```
  Value    Count   Percent
      0      500     10.00%
      1      500     10.00%
      2      500     10.00%
      3      500     10.00%
      4      500     10.00%
      5      500     10.00%
      6      500     10.00%
      7      500     10.00%
      8      500     10.00%
      9      500     10.00%
```
## Step 2: �w�K


���̕ӂ� [MathWorks Blog: Artificial Neural Networks for Beginners](https://blogs.mathworks.com/loren/2015/08/04/artificial-neural-networks-for-beginners/) �ɂ���ʂ�A�v���ł��ł��܂��B�ȉ��̓A�v������f���o���� MATLAB �R�[�h���قڂ��̂܂ܗ��p�B


```matlab
outputs = dummyvar(YTrain);       % convert label into a dummy variable
outputs = outputs';               % transpose dummy variable
inputs = reshape(XTrain,28*28,5000);

rng(1); % �Č����m�ۂ̂��ߗ���������

x = inputs;
t = outputs;
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
```


�����s��������Ă݂�ƈ����Ȃ����ʂł��B�ڍׂ͂ЂƂ܂��₢�܂���B


```matlab
plotconfusion(t,net(x))
```

![figure_1.png](MATLAB2WebAssembly_images/figure_1.png)

## Step 3: ���f���� MATLAB �֐���


�w�K�����l�b�g���[�N `net` ���R�[�h�����ɂ����Ă������߂� MATLAB �֐��ɕϊ����܂��B


```matlab
genFunction(net, 'digitPredictFcn');
```
```
 
MATLAB function generated: digitPredictFcn.m
To view generated function code: edit digitPredictFcn
For examples of using function: help digitPredictFcn
 
```
```matlab
% edit digitPredictFcn
```


����Ȋ����� `digitPredictionFcn.m` �A�l�b�g���[�N�̏d�݂������S�������o�����֐��t�@�C�����o���オ��܂��B


  
## Step 4: �R�[�h�����p�ɔ�����


�c�O�Ȃ���E�E�����łł����֐��ł̓R�[�h�����ɑΉ����Ă��Ȃ����������������Ă����̂ŁA C++ �Ɏ����ϊ�����ɂ͏����������K�v������܂����B�o���オ�������̂͂�����: GitHub: [digitPredictFcn.m](https://raw.githubusercontent.com/minoue-xx/handwritten-digit-prediction-on-browser/master/trainingModels/generateWebAssembly/digitPredictFcn.m)�B


  
### Step 4-1: �֐���`�A�A�T�[�V����
```matlab
function [Y,Xf,Af] = digitPredictFcn(X,~,~) 
```


�ƒ�`����Ă��܂����A�ȉ��̒ʂ�V���v���ɂP���͂P�o�͂̊֐��ɂ��܂��B


```matlab
function YY = digitPredictFcn(XX)
```


�܂��A�R�[�h�����p�ɓ��͈����̃T�C�Y�𖾋L���Ă����K�v������̂ŁA


```matlab
assert(isa(XX, 'double'));
assert(all( size(XX) == [ 28*28, 1 ]));
```


��`���ɒǋL���܂��B


  
### Step 4-2: �C������������
```matlab
X = {X}
```


double �^���Z���z��ɒu�������邱��ȏ����̓_���݂����ł��B


```matlab
% Format Input Arguments
isCellX = iscell(XX);
if ~isCellX
  X = {XX};
end
```


���͂�ϐ� `XX` �Ƃ��Z���z��ɂ������̂� `X` �ɁB���̌�͂��̂܂܁B


  
### Step 4-3: cell2mat �֐�


�\�����ʂ��Z���z�� Y �ŋA���Ă��āA�Ō�� double �^�ɕϊ����Ă��܂����Acell2mat �֐��̓R�[�h�����ΏۊO�B


```matlab
Y = cell2mat(Y);
```


�����͗��\�ȋC�����܂������͂Ƃ��ē����Ă���ϐ��T�C�Y�͌��܂��Ă���̂ŁA


```matlab
YY = Y{:};
```


�ƒu�������āA`YY` ���o�͕ϐ��Ƃ��܂��B


  


�֐����ł�����A`digitPredictFcn.m` ���v���W�F�N�g�ɒǉ����āA���x���� UserEntryPoints > Function �ɐݒ肵�Ă����܂��B




![image_3.png](MATLAB2WebAssembly_images/image_3.png)




����Ȋ����B


  
# 4. JavaScript �� WebAssembly �̐���


�ȉ��̃R�[�h�� MATLAB Project ����r���h���܂��B���� MATLAB Coder + Emscripten SDK ������܂��B


```matlab
proj = openProject(pwd);
webcoder.build.project(proj);
```
```
�R�[�h�̐������������܂���:���|�[�g�̕\��
```


�����ɏI������ƁAC++ �R�[�h�� build �t�H���_�ɏo�͂���܂��B����ɁA���� C++ �R�[�h�� `digitprediction.js` �� `digitprediction.wasm` �ɃR���p�C������āAdist �t�H���_�ɏo�͂���܂��B


  
# 5. HTML/JavaScript ����Ăяo��


���āA�悤�₭�{��BMDN �ɂ���


> JavaScript typed arrays are array-like objects and provide a mechanism for accessing raw binary data.




�Ƃ̂��ƂŁA���� JavaScript typed arrays ���g���āAJavaScript ���� optimizeposition.wasm �ƃf�[�^������肵�܂��B


  
## �����̗���

   1.  JavaScript typed array ���쐬 
   1.  typed array �̗v�f������K�v�ȗ̈���v�Z�Awasm ���̃��������m�� 
   1.  �m�ۂ����̈�� typed array �̒l���R�s�[ 
   1.  wasm ���̌v�Z���������s 
   1.  wasm ���̃��������� typed array �ɒl���R�s�[ 
   1.  �s�v�ɂȂ����̈����� 



1-3 �̏��������Ă���̂� `_arrayToHeap`�A5 �� `_heapToArray `�ł��B�����̏ڍׂ� [Guthub: Planeshifter/emscripten-examples](https://github.com/Planeshifter/emscripten-examples/tree/master/01_PassingArrays) �� README.md �̋L�q���Q�l�ɂȂ�܂��B


  
```matlab
    function getAccuracyScores(imageData) {

      let inputs = [];
      let length = 28 * 28; // �s�N�Z���T�C�Y

      for (let i = 0; i < length * 4; i = i + 4) { // �K�v�ȃs�N�Z���������o���܂�
        inputs.push(imageData.data[i] / 255);
      }
      console.log(inputs); // �m�F

      var Inputs = new Float64Array(inputs);
      var Outputs = new Float64Array(10);

      // Move Data to Heap var
      var Inputsbytes = _arrayToHeap(Inputs);
      var Outputsbytes = _arrayToHeap(Outputs);

      // Run Function
      Module._digitprediction_initialize();
      Module._digitPredictFcn(Inputsbytes.byteOffset, Outputsbytes.byteOffset)
      Module._digitprediction_terminate();

      // Copy Data from Heap 
      Outputs = _heapToArray(Outputsbytes, Outputs);
      var outputs = Array.from(Outputs);

      // Free Data from Heap 
      _freeArray(Inputsbytes);
      _freeArray(Outputsbytes);

      // Display Results
      console.log(outputs);
      const score = outputs;
      return score;
    }
```
## 6. ���ʂ��݂Ă݂悤


���[�J���T�[�o�𗧂ĂČ��ʂ��݂Ă݂܂��BFetch API �� file URI Scheme ���T�|�[�g���Ă��Ȃ����߁A�t�@�C���� http URI Scheme �ŃA�N�Z�X�ł���悤�ɂ���K�v������炵���BGenerate JavaScript Using MATLAB Coder �ɂ͊֐����p�ӂ���Ă܂��̂ł�����g���܂��B




��ق� `.js` �� `.wasm` ���o�͂��ꂽ�t�H���_ dist �� index.html ��u���܂��BMATLAB ��� dist ���J�����g�t�H���_�ɂ��āA


```matlab
server = webcoder.utilities.DevelopmentServer("Port",8125);
start(server);
```
```
Development Server serving directory '.' at locations:
    http://10.0.1.14:8125
    http://localhost:8125
```
```matlab
% �T�[�o�𗎂Ƃ��Ƃ���
% stop(server);
```


![image_4.png](MATLAB2WebAssembly_images/image_4.png)




�v�Z�͂ł��Ă���͗l�B�ЂƂ܂��߂ł����߂ł����B


  
# �܂Ƃ�


�ЂƂ܂� MATLAB �ŏ������l�b�g���[�N�� JavaScript ���琳�����Ăяo���Ă��邱�Ƃ��m�F�ł��܂����B




�����E�E�E���ۂ� [Github Pages: Hand-written Digit Prediction on Browser](https://minoue-xx.github.io/handwritten-digit-prediction-on-browser/) ���玎���Ă݂�Ƃ킩��ʂ�A���x�͂��܂����B���̓p�b�h��������Ă���摜���A�w�K�Ɏg�p�����摜�Ɛ������قȂ�̂��E�E�������� 5,000 �������Ȃ������̂������Ȃ̂��H���̕ӂɂ��Ă͂܂�������g��ł݂܂��B


