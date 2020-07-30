# Vim configure 
## Install pipeline

```bash
bash scripts/first_step.bash #(install vim8.0 and pull the vimrc)
#open vim and :PlugInstall
bash scripts/second_step.bash #(install YCM and color_cpp)

```

## Work prepare
```bash
cd .../vim_config
cp ycm_extra_conf.py ${YOUR_PROJECT_FOLDER}/.ycm_extra_config.py 
#(ex: cp ycm_extra_conf.py ~/work/allride/loc/.ycm_extra_config.py)
cd ${YOUR_PROJECT_FOLDER}/build
cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=yes #(in build folder)
```

> Notice:
The ".ycm_extra_config.py" should be in same level folder with "build",otherwise, 
we should modify the "compilation_database_folder" in ".ycm_extra_conf.py"

Add .ycm_extra_config.py to the .gitignore #(then the git will not track the file)
## Now,everything is ok!



