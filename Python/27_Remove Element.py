class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
                    
        while val in nums:
            nums.remove(val)
        
        int_len = len(nums)

        # This is for check!
        print(nums)        
        print(int_len)
        
        return int_len
