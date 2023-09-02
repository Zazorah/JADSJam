function scr_approach(_value, _target, _rate = 1) {
    
    // Approach a value without overtaking it.
    
    if (_value > _target) {
        return max(_value - _rate, _target);
    } else if (_value < _target) {
        return min(_value + _rate, _target);
    }
    
    return _target;
    
}