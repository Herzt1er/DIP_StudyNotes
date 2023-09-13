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

% f = imread('Fig0306(a)(bone-scan-GE).tif');
% subplot(1,2,1),imshow(f),title('(a) 骨骼扫描图像')
% g = intrans(f, 'stretch', mean2(im2double(f)), 0.9);
% subplot(1,2,2),imshow(g),title('(b) 对比度拉伸变换增强')

% f = imread('Fig0303(a)(breast).tif');
% figure, subplot(2, 2, 1), imhist(f);
% title('(a)imhist')
% h = imhist(f);h1 = h(1:10:256);
% horz = 1:10:256; % 水平轴以10个灰度级为一组
% subplot(2, 2, 2), bar(horz, h1);
% axis([0 255 0 3500]),title('(b)bar');
% set(gca, 'xtick', 0:50:255);
% set(gca, 'ytick', 0:500:3500);
% subplot(2, 2, 3), stem(horz, h1, 'fill');
% axis([0 255 0 3500]),title('(c)stem');
% set(gca, 'xtick', [0:50:255]);
% set(gca, 'ytick', [0:500:3500]);
% subplot(2, 2, 4), plot(h);
% axis([0 255 0 3500]),title('(d)plot');
% set(gca, 'xtick', [0:50:255]);
% set(gca, 'ytick', [0:500:3500]);

% f = imread('Fig0308(a)(pollen).tif');
% subplot(2,2,1),imshow(f);
% title('(a) 图像直方图均衡化前')
% ylim('auto'),g=histeq(f, 256);
% subplot(2,2,2),imhist(f),ylim('auto');
% subplot(2,2,3),imshow(g);
% title('(b) 图像直方图均衡化后')
% subplot(2,2,4),imhist(g),ylim('auto');
% % 变换函数仅是归一化直方图取值的累加
% hnorm = imhist(f) ./ numel(f);
% cdf = cumsum(hnorm);figure,imshow(cdf);
% x = linspace(0, 1, 256);
% plot(x,cdf),axis([0 1 0 1])
% set(gca, 'xtick', 0:.2:1)
% set(gca, 'ytick', 0:.2:1)
% xlabel('输入亮度值','fontsize',10)
% ylabel('输出亮度值','fontsize',10)
% text(0.18,0.5,'变换函数','fontsize',10)

% f = imread('Fig0310(a)(Moon Phobos).tif');
% subplot(3,2,1),imshow(f);
% title('(a) 原始图像')
% subplot(3,2,2),imhist(f);
% g = histeq(f, 256);
% subplot(3,2,3),imshow(g);
% title('(b) histeq(f, 256)增强直方图后图像')
% subplot(3,2,4),imhist(g);
% p = twomodegauss(0.15, 0.05, 0.75,0.05 ,1,0.07,0.002);
% g = histeq(f, p);
% subplot(3,2,5),imshow(g);
% title('(b) 指定直方图增强后图像')
% subplot(3,2,6),imhist(g);
% figure,imshow(p);
% x = linspace(0, 256, 256);
% plot(x,p),axis([0 260 0 0.02])
% set(gca, 'xtick', 0:20:260)
% set(gca, 'ytick', 0:.0025:0.02)
% text(80,0.015,'函数图形','fontsize',15)

% f = imread('Fig0315(a)(original_test_pattern).tif');
% w = ones(31);
% subplot(3,2,1),imshow(f);
% title('(a) 512×512 double类图像f')
% gd = imfilter(f, w);
% subplot(3,2,2),imshow(gd, [ ])
% title('(b) 默认的相关处理')
% gr = imfilter(f, w, 'replicate');
% subplot(3,2,3),imshow(gr, [ ])
% title('(c) 选项 replicate 处理')
% gs = imfilter(f, w, 'symmetric');
% subplot(3,2,4),imshow(gs, [ ])
% title('(d) 选项 symmetric 处理')
% gc = imfilter(f, w, 'circular');
% subplot(3,2,5),imshow(gc, [ ])
% title('(e) 选项 circular 处理')
% f8 = im2unit8(f);
% g8r = imfilter(f8, w, 'replicate');
% subplot(3,2,6),imshow(g8r, [ ])
% title('(f) 将原图像转换为unit8类图像')

% f = imread('Fig0315(a)(original_test_pattern).tif');
% subplot(1,3,1),imshow(f),title('(a) 原始图像')
% m = 31;n = 31;
% f = padarray(f, [m n], 'replicate');
% subplot(1,3,2),imshow(f),title('(b) 填充后的输入图像')
% g = colfilt(f, [m n], 'sliding', @gmean);
% subplot(1,3,3),imshow(g),title('(c) 非线性空间滤波后')

% f = imread('Fig0316(a)(moon).tif');
% subplot(2,2,1),imshow(f),title('(a) 原始图像')
% % w = fspecial('laplacian', 0);
% w = [0 1 0; 1 -4 1; 0 1 0];
% g1 = imfilter(f, w, 'replicate');
% subplot(2,2,2),imshow(g1),title('(b) 经拉普拉斯滤波后的 unit8 类图像')
% f2 = im2double(f);
% g2 = imfilter(f2, w, 'replicate');
% subplot(2,2,3),imshow(g2),title('(c) 经拉普拉斯滤波后的 double 类图像')
% g = f2 - g2;
% subplot(2,2,4),imshow(g),title('(d) 从(a)中减去(c)得到结果')

% f = imread('Fig0316(a)(moon).tif');
% subplot(1,3,1),imshow(f),title('(a) 原始图像')
% w4 = fspecial('laplacian', 0);
% w8 = [1 1 1; 1 -8 1; 1 1 1];
% f = im2double(f);
% g4 = f - imfilter(f, w4, 'replicate');
% subplot(1,3,2),imshow(g4),title('(b) 中心为 -4 的拉普拉斯滤波器 laplacian 增强')
% g8 = f - imfilter(f, w8, 'replicate');
% subplot(1,3,3),imshow(g8),title('(c) 中心为 -8 的拉普拉斯滤波器增强后')

f = imread('Fig0318(a)(ckt-board-orig).tif');
subplot(2,2,1),imshow(f),title('(a) X射线图像')
fn = imnoise(f, 'salt & pepper', 0.2);
subplot(2,2,2),imshow(fn),title('(b) 被椒盐噪声污染的图像')
gm = medfilt2(fn);
subplot(2,2,3),imshow(gm),title('(c) 默认设置中值滤波处理后')
gms = medfilt2(fn, 'symmetric');
subplot(2,2,4),imshow(gms),title('(d) 使用 symmetric 选项')