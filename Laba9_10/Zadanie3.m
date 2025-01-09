function out = calcImplication(x,x2)
x1 = linspace(1,15,1000);
z1 = trapmf(x1,[1,3,5,7]);
z2 = trapmf(x2,[1,2,4,6]);
Z = min(x,trapmf(x2,[1,2,4,6]));
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
plot(x2,Z);
ylim([-0.05 1.05]);
title("График функции импликации");
end

function out = calcDiffuz(m)
    x2 = linspace(0,15,1500);
    z=calcImplication(m,x2);
    out = defuzz(x2,z,'bisector');

    figure
    hold on;
    plot(x2,z);
    ylim([-0.05 1.05]);
    title("График функции импликации с центром области");
    gray = 0.7 * [1 1 1];
    h1.Color = gray;
    t1.Color = gray;
    h2 = line([out out],[-0.4 1.2],'Color','k');
    hold off;
end
calcDiffuz(1)