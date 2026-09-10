module Numbers
  # Direct recursion (_rec)

  def self.sum_of_first_n_rec(n)
    return 0 if n == 0

    n + sum_of_first_n_rec(n - 1)
  end

  def self.factorial_rec(n)
    return 1 if n == 0

    n * factorial_rec(n - 1)
  end

  def self.fibonacci_rec(n)
    return n if n <= 1

    fibonacci_rec(n - 1) + fibonacci_rec(n - 2)
  end

  def self.greatest_common_divisor_rec(a, b)
    return a if b == 0

    greatest_common_divisor_rec(b, a % b)
  end

  def self.least_common_multiple_rec(a, b)
    (a * b) / greatest_common_divisor_rec(a, b)
  end

  # Accumulator recursion (_acc): educational bridge, no TCO in Ruby

  def self.sum_of_first_n_acc(n)
    sum_of_first_n_acc_help(n, 0)
  end

  def self.sum_of_first_n_acc_help(n, acc)
    return acc if n <= 0

    sum_of_first_n_acc_help(n - 1, n + acc)
  end

  def self.factorial_acc(n)
    factorial_acc_help(n, 1)
  end

  def self.factorial_acc_help(n, acc)
    return acc if n <= 1

    factorial_acc_help(n - 1, n * acc)
  end

  def self.fibonacci_acc(n)
    fibonacci_acc_help(n, 0, 1)
  end

  def self.fibonacci_acc_help(n, acc2, acc1)
    return acc2 if n <= 0
    return acc1 + acc2 if n <= 2

    fibonacci_acc_help(n - 1, acc1, acc1 + acc2)
  end

  def self.greatest_common_divisor_acc(a, b)
    greatest_common_divisor_acc_help(a, b)
  end

  def self.greatest_common_divisor_acc_help(a, b)
    return a if b == 0

    greatest_common_divisor_acc_help(b, a % b)
  end

  def self.least_common_multiple_acc(a, b)
    (a * b) / greatest_common_divisor_acc(a, b)
  end

  # Iterative (_ite)

  def self.sum_of_first_n_ite(n)
    result = 0
    (1..n).each { |i| result += i }
    result
  end

  def self.factorial_ite(n)
    result = 1
    (2..n).each { |i| result *= i }
    result
  end

  def self.fibonacci_ite(n)
    return n if n <= 1

    acc2 = 0
    acc1 = 1
    (2..n).each do
      temp = acc1 + acc2
      acc2 = acc1
      acc1 = temp
    end
    acc1
  end

  def self.greatest_common_divisor_ite(a, b)
    while b != 0
      temp = b
      b = a % b
      a = temp
    end
    a
  end

  def self.least_common_multiple_ite(a, b)
    (a * b) / greatest_common_divisor_ite(a, b)
  end

  private_class_method :sum_of_first_n_acc_help,
                       :factorial_acc_help,
                       :fibonacci_acc_help,
                       :greatest_common_divisor_acc_help
end
