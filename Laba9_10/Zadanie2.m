function out = calcImplication(x1,x2)
[X,Y] = meshgrid(x1,x2);
z1 = trimf(x1,[3,5,7]);
z2 = zeros(size(x2));
z2 = z2 + normpdf(x2, 6, 1);
Z = min(trimf(X,[3,5,7]),normpdf(Y, 6, 1));
out = Z;

figure
subplot(2,1,1);
plot(x1,z1);
ylim([-0.05 1.05]);
title("График первой функции принадлежности");
xlabel("x");
ylabel("y");

subplot(2,1,2);
plot(x2,z2);
ylim([-0.05 1.05]);
title("График второй функции принадлежности");
xlabel("x");
ylabel("y");

figure
plot3(X,Y,Z);
title("График функции импликации");
end

x1 = linspace(0,15,100);
x2 = linspace(0,15,100);
calcImplication(x1,x2);