class Test
  def method1(arg1, arg2='', arg3=0)
    lol = Namespace::Lol.new(file, line)
    Namespace::SomeClass.new(arg1, arg2, lol)
  end

  def method2(arg1, arg2='', arg3=0)
    lol = Namespace::Lol.new(file, line)
    Namespace::SomeClass.new(arg1,arg2, lol)
  end
end