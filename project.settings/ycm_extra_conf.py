# author: minrui

from distutils.sysconfig import get_python_inc
import platform
import os
import subprocess
import ycm_core

DIR_OF_THIS_SCRIPT = os.path.abspath( os.path.dirname( __file__ ) )
DIR_OF_THIRD_PARTY = os.path.join( DIR_OF_THIS_SCRIPT, 'third_party' )
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

# set this to the directory which compile_commands.json
compilation_database_folder = '/home/mr/roadstar/control/build'

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.

#extra flags for both source and header files
extra_flag = [
'-I/usr/include/c++/5',
'-I/usr/include',
]

# flags for header files
flags = [
'-x',
'c++',
'-std=c++14',
# PERL_GEN_BEGIN
'-I/home/mr/roadstar/control',
'-DBOOST_GEOMETRY_OVERLAY_NO_THROW',
'-DBOOST_GEOMETRY_EXPERIMENTAL_ENABLE_INITIALIZER_LIST',
'-DDISABLE_PCAP',
'-I/usr/local/include',
'-Dcommon_kinematics_EXPORTS',
'-I/usr/include/x86_64-linux-gnu/qt5/QtGui',
'-DQT_CORE_LIB',
'-I/usr/include/ni',
'-Dcommon_proto_EXPORTS',
'-I/usr/include/qwt',
'-DvtkRenderingFreeType_AUTOINIT=\"2(vtkRenderingFreeTypeFontConfig,vtkRenderingMatplotlib)\"',
'-I/usr/include/libxml2',
'-isystem',
'/usr/include/x86_64-linux-gnu/qt5/QtWidgets',
'-isystem',
'/usr/include/x86_64-linux-gnu/qt5/QtGui',
'-DQT_WIDGETS_LIB',
'-DBOOST_EXCEPTION_DISABLE',
'-DROS_PACKAGE_NAME=\\\"car_inspector\\\"',
'-I/usr/include/x86_64-linux-gnu/qt5/QtCore',
'-DPCL_NO_PRECOMPILE',
'-isystem',
'/usr/include/x86_64-linux-gnu/qt5',
'-DQT_NO_DEBUG',
'-I/usr/include/freetype2',
'-DROS_PACKAGE_NAME=\\\"car_onboard\\\"',
'-I/usr/lib/openmpi/include/openmpi/opal/mca/event/libevent2021/libevent/include',
'-DFLANN_STATIC',
'-DvtkIOSQL_AUTOINIT=\"2(vtkIOMySQL,vtkIOPostgreSQL)\"',
'-I/usr/include/x86_64-linux-gnu/qt5',
'-Dcommon_road_map_EXPORTS',
'-I/usr/include/jsoncpp',
'-I/usr/include/x86_64-linux-gnu/qt5/QtWidgets',
'-I/home/mr/roadstar/control/inspector/include',
'-I/usr/include/pcl-1.7',
'-I/usr/lib/openmpi/include/openmpi/opal/mca/event/libevent2021/libevent',
'-I/usr/lib/openmpi/include',
'-DvtkRenderingLIC_AUTOINIT=\"1(vtkRenderingParallelLIC)\"',
'-isystem',
'/usr/include/x86_64-linux-gnu/qt5/QtOpenGL',
'-I/usr/include/tcl',
'-I/opt/ros/kinetic/share/xmlrpcpp/cmake/../../../include/xmlrpcpp',
'-DvtkFiltersFlowPaths_AUTOINIT=\"1(vtkFiltersParallelFlowPaths)\"',
'-DvtkRenderingContext2D_AUTOINIT=\"1(vtkRenderingContextOpenGL)\"',
'-I/usr/include/hdf5/openmpi',
'-isystem',
'/usr/include/x86_64-linux-gnu/qt5/QtCore',
'-I/home/mr/roadstar/control/build/inspector',
'-I/usr/lib/openmpi/include/openmpi',
'-I/opt/ros/kinetic/include/opencv-3.3.1-dev/opencv',
'-I/usr/include/x86_64-linux-gnu/freetype2',
'-I/home/mr/roadstar/control/common',
'-I/home/mr/roadstar/control/inspector',
'-DROSCPP_USE_TCP_NODELAY',
'-I/usr/include/eigen3',
'-DROS_PACKAGE_NAME=\\\"car_common\\\"',
'-DQT_GUI_LIB',
'-I/opt/ros/kinetic/include',
'-DvtkRenderingCore_AUTOINIT=\"4(vtkInteractionStyle,vtkRenderingFreeType,vtkRenderingFreeTypeOpenGL,vtkRenderingOpenGL)\"',
'-I/home/mr/roadstar/control/build/common/common/proto',
'-I/usr/include/x86_64-linux-gnu/qt5/QtOpenGL',
'-Dcommon_io_EXPORTS',
'-DEIGEN_NO_DEBUG',
'-Dcommon_thread_EXPORTS',
'-I/home/mr/roadstar/control/inspector/thirdparty/Theron-6.00.02/Include',
'-DEIGEN_USE_NEW_STDVECTOR',
'-DCAR_SOURCE_DIR=\\\"/home/mr/roadstar/control\\\"',
'-I/usr/include/qwtplot3d',
'-isystem',
'/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64',
'-DEIGEN_YES_I_KNOW_SPARSE_MODULE_IS_NOT_STABLE_YET',
'-Dcommon_geometry2_EXPORTS',
'-DQT_OPENGL_LIB',
'-DDISABLE_OPENNI2',
'-DvtkIOExodus_AUTOINIT=\"1(vtkIOParallelExodus)\"',
'-DDISABLE_PNG',
'-I/usr/include/vtk-6.2',
'-I/usr/include/python2.7',
'-Dcontrol_EXPORTS',
'-DROSCONSOLE_BACKEND_LOG4CXX',
'-Dcommon_miscellaneous_EXPORTS',
'-DvtkRenderingVolume_AUTOINIT=\"1(vtkRenderingVolumeOpenGL)\"',
'-Dcommon_c_EXPORTS',
'-DvtkIOImage_AUTOINIT=\"1(vtkIOMPIImage)\"',
'-I/opt/ros/kinetic/include/opencv-3.3.1-dev',
'-I/usr/include/x86_64-linux-gnu',
'-DROS_PACKAGE_NAME=\\\"car_control\\\"',
'-I/usr/lib/x86_64-linux-gnu/qt5/mkspecs/linux-g++-64',
'-I/home/mr/roadstar/control/build/devel/include',
'-DvtkIOGeometry_AUTOINIT=\"1(vtkIOMPIParallel)\"',
# PERL_GEN_END
]

# this is the only function that YCM needed
def Settings( **kwargs ):
  if kwargs[ 'language' ] == 'cfamily':
    filename = kwargs['filename']
    # if this file is in the database, use flags in database
    if database:
      compilation_info = database.GetCompilationInfoForFile( filename )
      if compilation_info.compiler_flags_:
        return {
                'flags': list(compilation_info.compiler_flags_) + extra_flag,
                'include_paths_relative_to_dir': compilation_info.compiler_working_dir_,
                'override_filename': filename
                }
    # else file is not the database, use what we set previous
    return {
            'flags': flags+extra_flag,
            'include_paths_relative_to_dir': DIR_OF_THIS_SCRIPT,
            'override_filename': filename
            }
  return {}
