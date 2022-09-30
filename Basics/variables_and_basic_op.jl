#https://juliateachingctu.github.io/Julia-for-Optimization-and-Learning/stable/lecture_01/variables/
# Author: hruskan1@fel.cvut.cz

# Variables
using Printf
n = 2 
@printf("%d, %s\n",n,typeof(n))
m = n + 1
@printf("%d, %s\n",m,typeof(m))

x = 1.5 
@printf("x :%f, but format x as integer: %d, %s\n",x,x,typeof(x))
x = 3
@printf("You cen retype the x: %d,%s\n",x,typeof(x))

x = 1.234
y = 1//2
z = x + y * im
print("Complex type:",z," ",typeof(z),"\n")

I_am_float = 3.1415
_new_variable = 1.
callMeRational = 1//3
MyString = "MyVariable"
δ = 1 # done by \delta<tab> = 1
🍕 = "It's time for pizza!" # \:pizza:<tab>
π
try
    global π = 2
catch e
    @warn e
    local π = 2
    print("Pi defined locally:",π,"\n")
end
@printf("%s : %f\n",π,π)
# But you can change variable value in REPL -Julia acts differently in REPL and script 
# -> desire to utilize REPL as Interactive enviroment as in Matlab. On the other hand, it is careful with namespace 
# See julia:worksapce panel in vscode

# We have reserved words
#struct = [] # syntax error

# Arithmetic
x = 4.3
y = 2.2

print(x ÷ y,'\n') # integer division (works also for floats, like y = 2.5)
print(x % y,'\n') # reminder (works also on floats (really, like y = 2.1))
print(x / y,'\n') # classical float division
print(x \ y,'\n') # inverse divison y/x
print(x * y,'\n')
print(x ^ y,'\n')

x = 4.0
p = 5

y = ((x+2)^2 -4)/(x-2)^(p-2)
print(y,'\n')
print(x,' ',typeof(x),' ',p,' ',typeof(p),'\n')
xp,yp = promote(x,y)
print(xp,' ',typeof(xp),' ',yp,' ',typeof(yp),'\n') 

x = 1
y = 1f0
z = true
w = Int32(1)
xp,yp,zp,wp = promote(x,y,z,w)

promote_type(typeof(x), typeof(y), typeof(z), typeof(w))

x = 5
p = 3
y = (x+4)^(3//2)/(x+1)^(p-1)
y *= 8
y += 3
y /= 3
y -= 1

# == equal
# != not equal
# & bitwise and, | bitwise or
# multiple conditions possible
# 1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5 
# ! Do not use:
#  NaN == NaN
#  NaN != NaN
#  NaN < NaN
# ! Use insted:
# isequal(x, y)
# isfinite(x)
# isinf(x)
# isnan(x)

# round(x),floor(x),ceil(x),(trunc(x) - towards zero)
x = 1252.1518
ceil(Int64,x) # or Int64(ceil(x))
floor(Int16,x) # or Int16(floor(x))
round(x,digits=2)
round(x,sigdigits=3)
round(x,sigdigits=2)

convert(Float32, 1.234)
convert(Int64, 1.234) # error 

x = 1//3
y = 0.5

# Strings

str = "Hello world"
str[1]
typeof(str[1])
str[1:1] # inclusive
typeof(str[1:1])
Int('a')
Char(120)
str[1:5]
typeof(str[1:5])
str[[1,2,5,6]]


# careful about string injection 

str1 = "This is how a string is created: \"string\"."
# use backslahs to interpret ",$,\ as normal text
# U can use ", if you are using triple qutes,"""

str == "Hello" * "World

# join 
# split 
# contains 
# occursin
# endswith
# findall(isequal('a'),str)
# findfirst(isequal('a'), str)
# findlast(isequal('a'), str)
# replace("Sherlock Holmes", "e" => "ee")

# The 2. class done

