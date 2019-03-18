let g:build_dir           = "/home/mr/roadstar/control/build"
let g:compile_command_dir = "/home/mr/roadstar/control/build"
let g:cmake_cmd = "source /opt/ros/kinetic/setup.bash && cmake .. -DCMAKE_EXPORT_COMPILE_COMMANDS=1"
let g:make_cmd = "source /opt/ros/kinetic/setup.bash && make install -j4"
