function g = intrans(f, varargin)
narginchk(2, 4);  % ���������������Ƿ����Ҫ��
classin = class(f);  % ��ȡ����ͼ�����������

if isa(f,'double') && max(f(:)) >1 && strcmp(varargin{1}, 'log')
    f = mat2gray(f);  % �������ͼ����˫���ȸ����Ͳ����������ֵ����1�����ҷ���Ϊ'log'����ʹ��mat2gray�������й�һ������
else
    f = im2double(f);  % ���򣬽�ͼ��ת��Ϊ˫���ȸ�����
end
method = varargin{1};  % ��ȡ��ǿ����

switch method  % ������ǿ�������в�ͬ�Ĳ���
    case 'neg'  % ��ת��Ƭ
        g = imcomplement(f);
    case 'log'  % �����任
        if length(varargin) == 1
            c = 1;
        elseif length(varargin) == 2
            c = varargin{2};
        elseif length(varargin) == 3
            c = varargin{2};
            classin = varargin{3};
        else
            error('Incorrect number of inputs for the log option.')  % �����任�����������������ȷ
        end
        g = c*(log(1+double(f)));  % ���ж����任
    case 'gamma'  % gamma�任
        if length(varargin)<2
            error('Not enough inputs for the gamma option.')  % ٤��任�������������
        end
        gam = varargin{2};
        g = imadjust(f, [ ], [ ], gam);  % ʹ��imadjust��������٤��任
    case 'stretch'  % �Աȶ�����
        if length(varargin) == 1
            m = mean2(f);
            E = 4.0;
        elseif length(varargin) == 3
            m = varargin{2};
            E = varargin{3};
        else
            error('Incorrect number of inputs for the stretch option.')  % �Աȶ���������������������ȷ
        end
        g = 1./(1+ (m./(f + eps)).^E );  % ���жԱȶ�����
    otherwise
        error('Unknown enhancement method.')  % δ֪����ǿ����
end
g = changeclass(classin, g);  % �����ͼ��ת����������ͼ����ͬ����������
end
