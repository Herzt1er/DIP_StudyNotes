% % ���� imadjust
% f = imread('Fig0303(a)(breast).tif');
% subplot(2,2,1),imshow(f)
% title('(a) ԭʼ�����鷿ͼ��')
% % ������תͼ�񣨸�Ƭͼ��
% % ��ǿǶ���ڴ�Ƭ��ɫ�����еİ�ɫ/��ɫϸ��
% % g = imcomplement(f); ͬ��Ч��
% g1 = imadjust(f,[0 1],[1 0]);
% subplot(2,2,2),imshow(g1),title('(b) ��Ƭͼ��')
% % ͻ������Ȥ�����ȴ� [0.5 0.75]
% g2 = imadjust(f,[0.5 0.75],[0 1]);
% subplot(2,2,3),imshow(g2),title('(c) ���ȷ�Χ��չΪ [ 0.5 , 0.75 ]')
% % ѹ���Ҷȼ��ĵͶ˲���չ�Ҷȼ��ĸ߶�
% g3 = imadjust(f,[ ],[ ],2);
% subplot(2,2,4),imshow(g3),title('(d) gamma = 2 ��ǿͼ��')

% f = imread('Fig0305(a)(spectrum).tif');
% subplot(1,2,1),imshow(f)
% title('(a)�����Ա����ߵ�8����ϵͳ�ϵĸ���ҶƵ��')
% % ȷ�������任���ͼ������ֵ��Χ�� [0,1] ��
% % ����Χ�� [0,1] ��ͼ��ת��Ϊ 8 λ�޷���������ʾ
% g = im2uint8(mat2gray(log(1+double(f))));
% subplot(1,2,2),imshow(g),title('(b) ִ�ж����任��')

% f = imread('Fig0306(a)(bone-scan-GE).tif');
% subplot(1,2,1),imshow(f),title('(a) ����ɨ��ͼ��')
% g = intrans(f, 'stretch', mean2(im2double(f)), 0.9);
% subplot(1,2,2),imshow(g),title('(b) �Աȶ�����任��ǿ')

% f = imread('Fig0303(a)(breast).tif');
% figure, subplot(2, 2, 1), imhist(f);
% title('(a)imhist')
% h = imhist(f);h1 = h(1:10:256);
% horz = 1:10:256; % ˮƽ����10���Ҷȼ�Ϊһ��
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
% title('(a) ͼ��ֱ��ͼ���⻯ǰ')
% ylim('auto'),g=histeq(f, 256);
% subplot(2,2,2),imhist(f),ylim('auto');
% subplot(2,2,3),imshow(g);
% title('(b) ͼ��ֱ��ͼ���⻯��')
% subplot(2,2,4),imhist(g),ylim('auto');
% % �任�������ǹ�һ��ֱ��ͼȡֵ���ۼ�
% hnorm = imhist(f) ./ numel(f);
% cdf = cumsum(hnorm);figure,imshow(cdf);
% x = linspace(0, 1, 256);
% plot(x,cdf),axis([0 1 0 1])
% set(gca, 'xtick', 0:.2:1)
% set(gca, 'ytick', 0:.2:1)
% xlabel('��������ֵ','fontsize',10)
% ylabel('�������ֵ','fontsize',10)
% text(0.18,0.5,'�任����','fontsize',10)

% f = imread('Fig0310(a)(Moon Phobos).tif');
% subplot(3,2,1),imshow(f);
% title('(a) ԭʼͼ��')
% subplot(3,2,2),imhist(f);
% g = histeq(f, 256);
% subplot(3,2,3),imshow(g);
% title('(b) histeq(f, 256)��ǿֱ��ͼ��ͼ��')
% subplot(3,2,4),imhist(g);
% p = twomodegauss(0.15, 0.05, 0.75,0.05 ,1,0.07,0.002);
% g = histeq(f, p);
% subplot(3,2,5),imshow(g);
% title('(b) ָ��ֱ��ͼ��ǿ��ͼ��')
% subplot(3,2,6),imhist(g);
% figure,imshow(p);
% x = linspace(0, 256, 256);
% plot(x,p),axis([0 260 0 0.02])
% set(gca, 'xtick', 0:20:260)
% set(gca, 'ytick', 0:.0025:0.02)
% text(80,0.015,'����ͼ��','fontsize',15)

% f = imread('Fig0315(a)(original_test_pattern).tif');
% w = ones(31);
% subplot(3,2,1),imshow(f);
% title('(a) 512��512 double��ͼ��f')
% gd = imfilter(f, w);
% subplot(3,2,2),imshow(gd, [ ])
% title('(b) Ĭ�ϵ���ش���')
% gr = imfilter(f, w, 'replicate');
% subplot(3,2,3),imshow(gr, [ ])
% title('(c) ѡ�� replicate ����')
% gs = imfilter(f, w, 'symmetric');
% subplot(3,2,4),imshow(gs, [ ])
% title('(d) ѡ�� symmetric ����')
% gc = imfilter(f, w, 'circular');
% subplot(3,2,5),imshow(gc, [ ])
% title('(e) ѡ�� circular ����')
% f8 = im2unit8(f);
% g8r = imfilter(f8, w, 'replicate');
% subplot(3,2,6),imshow(g8r, [ ])
% title('(f) ��ԭͼ��ת��Ϊunit8��ͼ��')

% f = imread('Fig0315(a)(original_test_pattern).tif');
% subplot(1,3,1),imshow(f),title('(a) ԭʼͼ��')
% m = 31;n = 31;
% f = padarray(f, [m n], 'replicate');
% subplot(1,3,2),imshow(f),title('(b) ���������ͼ��')
% g = colfilt(f, [m n], 'sliding', @gmean);
% subplot(1,3,3),imshow(g),title('(c) �����Կռ��˲���')

% f = imread('Fig0316(a)(moon).tif');
% subplot(2,2,1),imshow(f),title('(a) ԭʼͼ��')
% % w = fspecial('laplacian', 0);
% w = [0 1 0; 1 -4 1; 0 1 0];
% g1 = imfilter(f, w, 'replicate');
% subplot(2,2,2),imshow(g1),title('(b) ��������˹�˲���� unit8 ��ͼ��')
% f2 = im2double(f);
% g2 = imfilter(f2, w, 'replicate');
% subplot(2,2,3),imshow(g2),title('(c) ��������˹�˲���� double ��ͼ��')
% g = f2 - g2;
% subplot(2,2,4),imshow(g),title('(d) ��(a)�м�ȥ(c)�õ����')

% f = imread('Fig0316(a)(moon).tif');
% subplot(1,3,1),imshow(f),title('(a) ԭʼͼ��')
% w4 = fspecial('laplacian', 0);
% w8 = [1 1 1; 1 -8 1; 1 1 1];
% f = im2double(f);
% g4 = f - imfilter(f, w4, 'replicate');
% subplot(1,3,2),imshow(g4),title('(b) ����Ϊ -4 ��������˹�˲��� laplacian ��ǿ')
% g8 = f - imfilter(f, w8, 'replicate');
% subplot(1,3,3),imshow(g8),title('(c) ����Ϊ -8 ��������˹�˲�����ǿ��')

f = imread('Fig0318(a)(ckt-board-orig).tif');
subplot(2,2,1),imshow(f),title('(a) X����ͼ��')
fn = imnoise(f, 'salt & pepper', 0.2);
subplot(2,2,2),imshow(fn),title('(b) ������������Ⱦ��ͼ��')
gm = medfilt2(fn);
subplot(2,2,3),imshow(gm),title('(c) Ĭ��������ֵ�˲������')
gms = medfilt2(fn, 'symmetric');
subplot(2,2,4),imshow(gms),title('(d) ʹ�� symmetric ѡ��')