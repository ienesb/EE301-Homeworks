clear;
close all;

%% input signal

N = 15;
n = 0:1:(N-1);
x=sin(2*pi*n/7);
figure;
stem(n, x);
xlabel("n");
ylabel("x[n]");

%% impulse response

L = 10;
h = ones(1, L);
figure;
stem(0:L-1, h);
xlabel("n");
ylabel("h[n]");

%%

h_reversed = flip(h);
x_padded = [zeros(1, L-1) x zeros(1, L-1)];
y = zeros(1, N+L-1);

for i = 1:N+L-1
    y(i) = x_padded(i:i+L-1)*h_reversed';
end

y = y(1:N);
figure;
stem(n, y);
xlabel("n");
ylabel("y[n]");

%% conv

y_conv = conv(x,h);
figure;
stem(0:N+L-2, y_conv);
xlabel("n");
ylabel("y[n]");