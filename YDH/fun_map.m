function x_new = fun_map(x, a, b, a_new, b_new)

% a���� b���� range�� ������ �ִ� ���� x�� a_new���� b_new������ mapping

% normalize to 0 to 1

x_temp = (x - a) / (b - a);

x_new = x_temp * (b_new - a_new) + a_new;


