function scr_slice_array(_array, _start = 0, _end = -1) {
    
    // Returns a new array with just a range of indexes from the argued array.
    
    if (_start == _end) {
        return [];
    }
    
    if (_end == -1) {
        _end = array_length(_array);
    }
    
    var result = [];
    for (var i = _start; i < _end; i++) {
        array_push(result, _array[i]);
    }
    
    return result;
}