#ifndef __SYNTAX_TABLE_H__
#define __SYNTAX_TABLE_H__

struct dataType {
    char *id_name;
    char *data_type;
    char *type;
    int line_no;
};

int search(char *type);

void add(char c);

void insert_type();

void print_table();

#endif
