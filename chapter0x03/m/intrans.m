function g = intrans(f, varargin)
narginchk(2, 4);  % 检查输入参数个数是否符合要求
classin = class(f);  % 获取输入图像的数据类型

if isa(f,'double') && max(f(:)) >1 && strcmp(varargin{1}, 'log')
    f = mat2gray(f);  % 如果输入图像是双精度浮点型并且最大像素值大于1，并且方法为'log'，则使用mat2gray函数进行归一化处理
else
    f = im2double(f);  % 否则，将图像转换为双精度浮点型
end
method = varargin{1};  % 获取增强方法

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
            error('Incorrect number of inputs for the log option.')  % 对数变换的输入参数个数不正确
        end
        g = c*(log(1+double(f)));  % 进行对数变换
    case 'gamma'  % gamma变换
        if length(varargin)<2
            error('Not enough inputs for the gamma option.')  % 伽马变换的输入参数不足
        end
        gam = varargin{2};
        g = imadjust(f, [ ], [ ], gam);  % 使用imadjust函数进行伽马变换
    case 'stretch'  % 对比度拉伸
        if length(varargin) == 1
            m = mean2(f);
            E = 4.0;
        elseif length(varargin) == 3
            m = varargin{2};
            E = varargin{3};
        else
            error('Incorrect number of inputs for the stretch option.')  % 对比度拉伸的输入参数个数不正确
        end
        g = 1./(1+ (m./(f + eps)).^E );  % 进行对比度拉伸
    otherwise
        error('Unknown enhancement method.')  % 未知的增强方法
end
g = changeclass(classin, g);  % 将输出图像转换回与输入图像相同的数据类型
end
