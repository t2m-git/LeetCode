class Solution:
    def addBinary(self, a: str, b: str) -> str:
        """
        :type a: str
        :type b: str
        :rtype: str
        """
        
        """l1, l2 = len(a), len(b)
        carry = 0
        lst_la = []
        lst_lb = []
        
        if l1 < l2:
            l1, l2 = l2, l1
            a, b = b, a
            
        for char in a:
            lst_la.append(int(char))
        
        for char in b:
            lst_lb.append(int(char))
        
        lst_la, lst_lb = lst_la[::-1], lst_lb[::-1]
        
        for i in range(l1):
            if i < l2:
                lst_la[i] += lst_lb[i]
            if lst_la[i] > 1:
                lst_la[i] -= 2
                if i != l1 - 1:
                    lst_la[i + 1] += 1
                else:
                    lst_la.append(1)

        return "".join(str(x) for x in lst_la[::-1])
        """
        n = max(len(a), len(b))
        a, b = a.zfill(n), b.zfill(n)
        
        carry = 0
        answer = []
        for i in range(n - 1, -1, -1):
            if a[i] == '1':
                carry += 1
            if b[i] == '1':
                carry += 1
                
            if carry % 2 == 1:
                answer.append('1')
            else:
                answer.append('0')
            
            carry //= 2
        
        if carry == 1:
            answer.append('1')
        #answer.reverse()
        answer = answer[::-1]
        
        return ''.join(answer)
