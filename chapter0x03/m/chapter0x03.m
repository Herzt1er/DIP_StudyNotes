% % 函数 imadjust
% f = imread('Fig0303(a)(breast).tif');
% subplot(2,2,1),imshow(f)
% title('(a) 原始数字乳房图像')
% % 明暗反转图像（负片图像）
% % 增强嵌入在大片黑色区域中的白色/灰色细节
% % g = imcomplement(f); 同等效果
% g1 = imadjust(f,[0 1],[1 0]);
% subplot(2,2,2),imshow(g1),title('(b) 负片图像')
% % 突出感兴趣的亮度带 [0.5 0.75]
% g2 = imadjust(f,[0.5 0.75],[0 1]);
% subplot(2,2,3),imshow(g2),title('(c) 亮度范围拓展为 [ 0.5 , 0.75 ]')
% % 压缩灰度级的低端并扩展灰度级的高端
% g3 = imadjust(f,[ ],[ ],2);
% subplot(2,2,4),imshow(g3),title('(d) gamma = 2 增强图像')

% f = imread('Fig0305(a)(spectrum).tif');
% subplot(1,2,1),imshow(f)
% title('(a)在线性比例尺的8比特系统上的傅里叶频谱')
% % 确保对数变换后的图像像素值范围在 [0,1] 内
% % 将范围在 [0,1] 的图像转换为 8 位无符号整数表示
% g = im2uint8(mat2gray(log(1+double(f))));
% subplot(1,2,2),imshow(g),title('(b) 执行对数变换后')

f = imread('Fig0306(a)(bone-scan-GE).tif');
subplot(1,2,1),imshow(f),title('(a) 骨骼扫描图像')
g = intrans(f, 'stretch', mean2(im2double(f)), 0.9);
subplot(1,2,2),imshow(g),title('(b) 对比度拉伸变换增强')