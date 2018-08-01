## mtDNA_Pipeline 说明文档
### Author: MatthewP
**服务器：**   深圳服务器  

**脚本地址：**
 /ifs1/Reotech/user/pengguoyu/mtDNA  

**项目执行地址：**
/ifs1/Reotech/project/mtDNA/  

#### 操作步骤
1. 进入项目地址：/ifs1/Reotech/project/mtDNA/
2. 按照当天日期建立文件夹，比如：`mkdir 20180613`
3. 编辑shell脚本，比如`vim mtDNA.sh`
4. shell脚本内容示范如下：
>python /ifs1/Reotech/user/pengguoyu/mtDNA/mtDNA_Pipeline.py -s "20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07049,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07050,20180613/RunByWDL/BB5118402-18
524A-A019V1-PM4-XX-18R07051,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07052,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07053,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07054,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07055,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07056,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07057,20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07058" -l "18R07049,18R07050,18R07051,18R07052,18R07053,18R07054,18R07055,18R07056,18R07057,18R07058" -n /ifs1/Reotech/project/mtDNA/20180613/RunByWDL/18R070 -o /ifs1/Reotech/project/mtDNA/20180613/RunByWDL/inputs.json
5. 保存并运行shell脚本：`sh mtDNA.sh`
6. 最终结果文件为`-n`参数加上`_result.vcf`文件。如`-n`参数为/ifs1/Reotech/project/mtDNA/20180613/RunByWDL/18R070
那么最终结果文件为/ifs1/Reotech/project/mtDNA/20180613/RunByWDL/18R070_result.vcf

#### <font color=#28B463>脚本说明</font>   

shell脚本调用了 /ifs1/Reotech/user/pengguoyu/mtDNA/mtDNA_Pipeline.py
`mtDNA_Pipeline.py` 建议使用python3.6+运行，需要4个参数:

- -s  Rawdata的部分路径，比如：/ifs1/Reotech/project/mtDNA/ **20180613/RunByWDL/BB5118402-18524A-A019V1-PM4-XX-18R07058** \_R1.fastq.gz 取加粗部分即可，前面的项目路径 `/ifs1/Reotech/project/mtDNA/`和后面的`\_R1.fastq.gz`

或者`\_R2.fastq.gz`部分不需要,脚本会将那些部分补齐。一次运行多个样品的时候，将多个样品放在同一个字符串下，样品间用`","`分隔。

- -l  样品ID，由于 **Varscan2** 进行virant call的时候，无法正确获取样品名，需要将样品ID用列表形式写在文件里，传给 **Varscan2**
同`-s`一样，按照顺序将样品ID放在同一个字符串，用`","`进行分割。~~ **注意** ~~：这里样品ID顺序需要和`-s`的Rawdata顺序一致！

- -n  在 **samtools mpileup** 后，所有的样品被合并为一个样品，直至整个流程结束。往后样品，
需要一个样品路径与基础名字。比如 **/ifs1/Reotech/project/mtDNA/20180613/RunByWDL/** 18R070其中加粗部分为路径，18R070为文件基础名字，后续步骤将按此产生各步文件，比如：/ifs1/Reotech/project/mtDNA/20180613/RunByWDL/18R070_snpEff.vcf  或者: /ifs1/Reotech/project/mtDNA/20180613/RunByWDL/18R070_result.vcf

 -o  **mtDNA_Pipeline.py** 会调用 **mtDNA_Pipeline.wdl**，而**mtDNA_Pipeline.wdl** 需要一个json文件作为`inputs`配置，这里需要指定该文件地址(python)脚本会生成该json，仅仅指定地址即可。比如： /ifs1/Reotech/project/mtDNA/20180613/RunByWDL/inputs.json
