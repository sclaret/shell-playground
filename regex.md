# Structure

    ( ) grouping
    a|b either a or b


# Quantifier

    ? 0 or 1 occurrence
    * 0 or any number of occurrences
    + any number of occurrences
    {x} x occurrences
    {x,y} x to y occurrences


# Positions

    ^ / $ line beginning / ending
    \b word border position
    \B in-word position
    (?=x) lookahead if x comes next


# Characters

    . any character
    \d / \D digit / any other
    \s / \S whitespace / any other
    \w / \W alpha-numeric / any other
    [ab] any character a or b
    [^ab] any character but a and b
