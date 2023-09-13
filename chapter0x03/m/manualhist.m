% 定义 manualhist 函数
function p = manualhist
% 初始化 repeats 为真以控制循环
repeats = true;
% 定义退出字符 'x'
quitnow = 'x';
% 使用初始高斯混合模型初始化 p
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);

% 开始输入循环
while repeats
    % 提示用户输入值或输入 'x' 退出
    s = input('请输入 m1、sig1、m2、sig2、A1、A2、k 或 x 退出:', 's');
    % 检查输入是否为 'x' 以退出循环
    if s == quitnow
        break
    end
    % 将输入字符串转换为数字数组
    v = str2num(s);
    % 检查输入是否包含 7 个数字值
    if numel(v) ~= 7
        disp('输入数量不正确。')
        continue
    end
    % 根据用户输入更新 p 的高斯混合模型
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    % 创建新图形并绘制更新的高斯混合模型
    figure, plot(p)
    xlim([0 255])
end
