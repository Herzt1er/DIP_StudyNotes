function [rt1,rt2, f1,f2, g,t1,t2,t3] = twodsin(A, u0, v0, M, N)
tic
for r = 1:M
    u0x = u0 * (r-1);
    for c = 1:N
        v0y = v0 * (c-1);
        f1(r, c) = A * sin(u0x + v0y);
    end
end
t1 = toc;tic
% 预分配内存并初始化 f
f2 = zeros(M, N);

for r = 1:M
    u0x = u0 * (r-1);
    for c = 1:N
        v0y = v0 * (c-1);
        f2(r, c) = A * sin(u0x + v0y);
    end
end

t2 = toc;tic
r = 0:M-1;c = 0:N-1;
[C, R] = meshgrid(c, r);
g = A * sin(u0 * R + v0 * C);
t3 = toc;

rt1 = t1 / (t2 + eps);
rt2 = t2 / (t3 + eps);
end
