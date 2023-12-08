#ifndef __SYNTAX_TREE_H__
#define __SYNTAX_TREE_H__


struct ASTnode {
    struct node *right;
    struct node *left;
    char *token;
};


struct ASTnode *ASTadd_node(struct ASTnode *left, 
                            struct ASTnode *right, 
                            char *token);

void ASTadd_type();

void ASTprint(struct ASTnode*);

void ASTprint_ordered(struct ASTnode*);


#endif
