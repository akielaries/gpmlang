#ifndef __S_TABLE_H__
#define __S_TABLE_H__


struct DataType {
        char * id_name;
        char * data_type;
        char * type;
        int line_no;
} symbol_table[40];

int search(char *type);

void add(char c);

void insert_type();

void print_table();

#endif
