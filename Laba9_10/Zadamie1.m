function out = NormParams()
    x = 3:0.01:11;
    y = normpdf(x, 7, 1);
    plot(x,y);
    ylim([-0.01 1.05])
    out = y;
end
NormParams();