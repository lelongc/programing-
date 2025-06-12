ten = "Test"
tuoi = 20
def test():
                global ten
                ten = "Test2"
                print(ten)
                print(tuoi)
test()
print(ten)      
print(tuoi)
# Output:
# Test2
# 20
# Test2
# Explanation:  
# The function test() modifies the global variable ten, but it does not modify the global variable tuoi.
# The global variable ten is changed to "Test2" inside the function, but the global variable tuoi remains unchanged.            