### Option
option与变量不同，采用`set`来设置其值，根据option类型的不同，采用不同的设置方式。
-  bool型option  
   `set number` option `number` is set to true  
   `set nonumber` option `number` is set to false  
   `set number!` option `number` is toggled

-  value型option  
   `set numberwitdh=10` option `numberwidth` is set to 10  

-  要查看某个option的值:  
   `set option_name?`  
   例如 `set number?`, `set numberwidth?`  

### Abbreviations
   abbreviation与mapping类似，但是触发条件不同，mapping的触发更加粗暴，只要发现匹配的字符
   就会进行替换，但是abbreviation会根据匹配的字符串的前后字符是否为单词边界来决定是否展开

### Buffer-local mapping and options
   有一些mapping和option可以只在当前的buffer起作用，例如nerdtree的窗口里的快捷键就和普通文件不一样   

   :noremap &lt;localleader&gt;d dd  
   :noremap &lt;buffer&gt; &lt;localleader&gt;x dd  
   第一个map在所有的buffer中起作用，而第二个映射只在当前buffer起作用
