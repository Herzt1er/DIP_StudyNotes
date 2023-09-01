## 第3章 亮度变换与空间滤波

### 3.1 前言

- 空间滤波有时称为领域处理或空间卷积
- 空间域处理务必注意数据类和取值范围
- 当处理单色（灰度）图像时，亮度和灰度两个术语可以互相换用；当处理彩色图像时，**亮度**用来表示某个色彩空间中的一个彩色图像分量

### 3.2 亮度变换函数

- 函数 `imadjust`
  - 对灰度图像进行亮度变换的基本IPT工具
  - ![Alt text](img/image-19.png)
  - 参数 `gamma` 指定曲线的形状，用来映射 f 的亮度值生成图像 g，默认为1（线性映射）
  - ![img](img/ch3_2_1.png)

```matlab
% 明暗反转图像（负片图像）
% 增强嵌入在大片黑色区域中的白色/灰色细节
% g = imcomplement(f); 同等效果
g1 = imadjust(f,[0 1],[1 0]);
subplot(2,2,2),imshow(g1),title('(b) 负片图像')
% 突出感兴趣的亮度带 [0.5 0.75]
g2 = imadjust(f,[0.5 0.75],[0 1]);
subplot(2,2,3),imshow(g2),title('(c) 亮度范围拓展为 [ 0.5 , 0.75 ]')
% 压缩灰度级的低端并扩展灰度级的高端 拥有更多灰色调
g3 = imadjust(f,[ ],[ ],2);
subplot(2,2,4),imshow(g3),title('(d) gamma = 2 增强图像')
```

- `对数与对比度拉伸变换` 是进行动态范围处理的基本工具
  - 对数变换表达式：`g = c*log(1 + double(f))`
  - gamma 曲线的形状是可变的，而对数函数形状则是固定的
  - 主要应用：压缩动态范围
    - 期望将导致的压缩值还原为显示的全范围。对8比特而言，最简方法
      - `gs = im2unit8(mat2gray(g))`
  - 对比度拉伸变换函数
    - 将输入值低于m的灰度级压缩为输出图像中较暗灰度级的较窄范围内
    - 阈值函数限制条件下输出二值图像，是进行图形分割的有效工具
    - ![Alt text](img/image.png)
    - ![Alt text](img/image-1.png)
> 对数变换可以扩展图像亮度范围，使得暗部细节更加明显。
- 使用对数变换减小动态范围
  - ![img](img/ch3_2_2.png)
```matlab
f = imread('Fig0305(a)(spectrum).tif');
subplot(1,2,1),imshow(f)
title('(a)在线性比例尺的8比特系统上的傅里叶频谱')
% 确保对数变换后的图像像素值范围在 [0,1] 内
% 将范围在 [0,1] 的图像转换为 8 位无符号整数表示
g = im2uint8(mat2gray(log(1+double(f))));
subplot(1,2,2),imshow(g),title('(b) 执行对数变换后')
```

- 处理可变数量的输入和/或输出
  - 函数 `nargin` 返回输入到 M 函数的参量的实际数目
  - 函数 `nargiout` 返回输入到 M 函数的参量的实际数目
  - 函数 `nargchk` 检测传递的参数数量数目正确性
    - `nargchk(low, high, number)`
    - number小于low时返回消息Not enough input parameters
    - number大于high时返回消息Too many input parameters
    - 介于low与high之间，返回一个空矩阵
    - 示例：`error(nargchk(2, 3, nargin))`
  - 当 `varargin` 用作一个函数的输入变量时，MATLAB会将其置入一个单元数组中，该数组接受由用户输入的变量数

- 函数 `intrans`：负片变换、对数变换、gamma变换和对比度拉伸变换
  - ![img](img/ch3_2_3.png)

- `changeclass.m` 将输出图像转换回与输入图像相同的数据类型

```matlab
function image = changeclass(class, varargin)
switch class
    case 'uint8'
        image = im2uint8(varargin{:});
    case 'uint16'
        image = im2uint16(varargin{:});
    case 'double'
        image = im2double(varargin{:});
    otherwise
        error('Unsupported IPT data class.');
end
```
- `intrans.m `

```matlab
function g = intrans(f, varargin)
narginchk(2, 4);  % 检查输入参数个数是否符合要求
classin = class(f);  % 获取输入图像的数据类型

method = varargin{1};  % 获取增强方法

if isa(f,'double') && max(f(:)) >1 && strcmp(method, 'log')
    f = mat2gray(f);  % 双精度浮点型并且最大像素值大于1，归一化处理
else
    f = im2double(f);  % 否则，将图像转换为双精度浮点型
end

switch method  % 根据增强方法进行不同的操作
    case 'neg'  % 反转负片
        g = imcomplement(f);
    case 'log'  % 对数变换
        if length(varargin) == 1
            c = 1;
        elseif length(varargin) == 2
            c = varargin{2};
        elseif length(varargin) == 3
            c = varargin{2};
            classin = varargin{3};
        else
            error('Incorrect number of inputs for the log option.')  
        end
        g = c*(log(1+double(f)));  % 进行对数变换
    case 'gamma'  % gamma变换
        if length(varargin)<2
            error('Not enough inputs for the gamma option.')  %
        end
        gam = varargin{2};
        g = imadjust(f, [ ], [ ], gam); 
    case 'stretch'  % 对比度拉伸
        if length(varargin) == 1
            % 计算平均灰度值
            m = mean2(f);
            E = 4.0;
        elseif length(varargin) == 3
            m = varargin{2};
            E = varargin{3};
        else
            error('Incorrect number of inputs for the stretch option.')
        end
        g = 1./(1+ (m./(f + eps)).^E );  % 进行对比度拉伸
    otherwise
        error('Unknown enhancement method.') 
end
g = changeclass(classin, g); 
end
```

```matlab
f = imread('Fig0306(a)(bone-scan-GE).tif');
subplot(1,2,1),imshow(f),title('(a) 骨骼扫描图像')
g = intrans(f, 'stretch', mean2(im2double(f)), 0.9);
subplot(1,2,2),imshow(g),title('(b) 对比度拉伸变换增强')
```

- 函数 `gscale` 把图像标度在全尺度，即最大范围[0,255]或[0,65535]
  - ![Alt text](img/image-2.png)

### 3.3 直方图处理与函数绘图

- 生成并绘制图像的直方图
  - 一幅数字图像在范围[0,G]内总共有L个灰度级，其直方图定义为离散函数
  - ![Alt text](img/image-3.png)