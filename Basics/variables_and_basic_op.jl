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
print(x,' ',typeof(x),' ',p,' ',typeof(p))
xp,yp = promote(x,y)
print(xp,' ',typeof(xp),' ',yp,' ',typeof(yp))







