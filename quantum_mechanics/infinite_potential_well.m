hbar = 1.0545718e-34;
m = 9.10938356e-31;
L = 10e-9;
N = 100;
x = linspace(0, L, N);
dx = x(2) - x(1);
H = zeros(N, N);
psi = zeros(N, 7);
psi2 = zeros(N, 7);
for i = 1:N
for j = 1:N
if i == j
H(i, j) = -2;
elseif abs(i-j) == 1
H(i, j) = 1;
end
end
end
H = -hbar^2 / (2*m*dx^2) * H;
[E, V] = eig(H);
for n = 1:7
psi(:, n) = V(:, n) / sqrt(sum(V(:, n).^2));
psi2(:, n) = abs(psi(:, n)).^2;
end
for n = 1:7
subplot(7, 2, 2*n-1);
plot(x, psi(:, n));
title(['\psi for state ', num2str(n)]);
xlabel('Position (m)');
ylabel('\psi');
subplot(7, 2, 2*n);
plot(x, psi2(:, n));
title(['|\psi|^2 for state ', num2str(n)]);
xlabel('Position (m)');
ylabel('|\psi|^2');
end