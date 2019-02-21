#define ter
/// ter(condition, consequence, alternative)
if(argument0){
    return argument1;
}else{
    return argument2;
}

#define print
/// print(text)
show_debug_message(argument0);

#define python_function
///python_function(function)
func = "print("+argument0+")"; //foo(x)
cmd = "python -c"+'"'+func+'"';//COMMAND
result = external_call(global.python_start_call,cmd);
result = ter(string_letters(result) == "", real(result), result);
return result;

#define python_lib_function
/// python_lib_function(lib, function)
lib = argument0; // import lib
func = "print("+lib+"."+argument1+")"; //lib.foo(x)
cmd = "python -c"+'"'+"import "+lib+";"+func+'"';//COMMAND
result = external_call(global.python_start_call,cmd);
result = ter(string_letters(result) == "", real(result), result);
return result;

#define PYTHON_START
/// PYTHON_START()
global.python_start_call = external_define("GMython.dll","get_function",dll_cdecl,ty_string, 1, ty_string);


#define import
/// import(lib)
imp_lib = argument0;
return imp_lib;

