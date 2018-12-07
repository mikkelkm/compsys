struct db {
    char **nick;
    char **password;
};

int init_db(int capacity){

    struct db *db;

    // mem alloc for users
    db->nick = calloc(capacity, sizeof(char*));
    db->password = calloc(capacity, sizeof(char*));

    return 0;
}



