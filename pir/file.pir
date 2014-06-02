# example-06-01

.loadlib 'io_ops'

.sub 'main' :main
    .local string filename
    .local pmc    data_file
    .local int    star_count
    .local string current_line

    filename = 'test.txt'
    star_count = 0
    data_file = open filename, 'r'

    # Avoid counting the header line as a star
    current_line = readline data_file

  NEXT_STAR:
    unless data_file goto SHOW_STAR_COUNT
    current_line = readline data_file
    star_count += 1
    goto NEXT_STAR

  SHOW_STAR_COUNT:
    close data_file
    print 'There are '
    print star_count
    say ' stars in the HYG catalog.'

.end