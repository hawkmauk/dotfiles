define print_vector
    if $argc == 2
    set $elem = $arg0.size()
    if $arg1 >= $arg0.size()
        printf "Error, %s.size() = %d, printing last element:\n", "$arg0", $arg0.size()
        set $elem = $arg1 -1
        end
        print *($arg0._M_impl._M_start + $elem)@1
    else
        print *($arg0._M_impl._M_start)@$arg0.size()
    end
end

document print_vector
Display vector contents
Usage: print_vector VECTOR_NAME INDEX
VECTOR_NAME is the name of the vector
INDEX is an optional argument specifying the element to display
end
