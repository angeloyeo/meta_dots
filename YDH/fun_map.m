function x_new = fun_map(x, a, b, a_new, b_new)

% a에서 b까지 range를 가지고 있는 변수 x를 a_new에서 b_new까지로 mapping

% normalize to 0 to 1

x_temp = (x - a) / (b - a);

x_new = x_temp * (b_new - a_new) + a_new;


