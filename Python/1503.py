class Solution:
    def numSubmat(self, mat: List[List[int]]) -> int:
        
        m = len(mat)-1
        n = len(mat[0])-1
        for i in range(m+1):
            for j in range(1,n+1):
                if mat[i][j]==1:
                    mat[i][j]+=mat[i][j-1]
        res = 0 
        for y in range(n+1):
            for z in range(y,n+1):
                i = 0
                while(i<m+1):
                    j = i 
                    while(j<m+1 and mat[j][z]>=z-y+1):
                        res+=j-i+1
                        j+=1
                    i = j+1
        return res
