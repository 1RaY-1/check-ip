#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <locale.h>
#include <time.h>

#define DATA_FILE "data.txt"
#define OR ||
#define AND &&

#define USAGE printf("Usage: %s [OPTION] IP_ADRESSES_TO_CHECK\n", argv[0]); \
    printf("Options:\n-s   Save data to data.txt\n-h, --help   Get this help message\n"); \
    printf("\nExample: %s -s 8.8.8.8 github.com\n", argv[0]);

void check(char *argv[], int SAVE_DATA, int a, int argc){
    
    // Start
    printf("[INFO] Checking: ");
    for (int i = a; i < argc; i++){
        printf("%s ", argv[i]);
    }
    printf("\n\n");
    for (int i = a; i < argc; i++){
#ifdef _WIN32
        char command[100] = "ping ";
        strcat(command, argv[i]);
        strcat(command, " >");
        strcat(command, ".temp__null__file"); 
        int response = system(command);
        remove(".temp__null__file");
#else
#include <sys/wait.h>
        char command[100] = "ping -c 2 ";
        strcat(command, argv[i]);
        strcat(command, " >/dev/null 2>&1");
        int response = WEXITSTATUS(system(command));

#endif
        switch(response){
            // Alive
            case 0:
                printf("[INFO] ---> %s is alive\n", argv[i]);
                if (SAVE_DATA == 1){
                    FILE *fp;
                    fp = fopen(DATA_FILE, "a+");
                    
                    time_t t = time(NULL);
                    struct tm *tm = localtime(&t);

                    fprintf(fp, "%s ---> '%s' was alive\n\n", asctime(tm), argv[i]);
                    fclose(fp);
                }
                break;

            // Unreachable
            case 1:
            case 256:
                printf("[INFO] ---> %s is unreachable\n", argv[i]);
                if (SAVE_DATA == 1){
                    FILE *fp;
                    fp = fopen(DATA_FILE, "a+");
                    
                    time_t t = time(NULL);
                    struct tm *tm = localtime(&t);

                    fprintf(fp, "%s ---> '%s' was unreachable\n\n", asctime(tm), argv[i]);
                    fclose(fp);
                }
                break;

            // Unknown host
            case 2:
            case 68:
                printf("[INFO] ---> %s unknown host\n", argv[i]);
                if (SAVE_DATA == 1){
                    FILE *fp;
                    fp = fopen(DATA_FILE, "a+");
                    
                    time_t t = time(NULL);
                    struct tm *tm = localtime(&t);

                    fprintf(fp, "%s ---> '%s' unknown host\n\n", asctime(tm), argv[i]);
                    fclose(fp);
                }
                break;

            // Unknown code
            default:    
                printf("[INFO] ---> %s is probably inactive\n", argv[i]);
                if (SAVE_DATA == 1){
                    FILE *fp;
                    fp = fopen(DATA_FILE, "a+");

                    time_t t = time(NULL);
                    struct tm *tm = localtime(&t);
                
                    fprintf(fp, "%s ---> '%s' was probably inactive\n\n", asctime(tm), argv[i]);
                    fclose(fp);
            }
                break;

        }
    }
    if (SAVE_DATA == 1){
        printf("\n[INFO] This have been saved to '%s'.\n", DATA_FILE);
    }
}

int main(int argc, char *argv[]){

    // Check command line arguments
    if (argc == 1){
        USAGE
        return 1;
    }
    else if (strcmp("-h", argv[1]) == 0 OR strcmp("--help", argv[1]) == 0){
        USAGE
        return 0;
    }
    else if (strcmp("-s", argv[1]) == 0 AND argc == 2){
        USAGE
        return 1;
    }
    else if (argc > 1 AND strcmp("-s", argv[1]) == 0){
        int a = 2;
        int SAVE_DATA = 1; // 1 is true, 0 is false
        check(argv, SAVE_DATA, a, argc);
    }
    else if (argc > 1 AND strcmp("-s", argv[1]) != 0){
        int a = 1;
        int SAVE_DATA = 0;
        check(argv, SAVE_DATA, a, argc);
    }
    else {
        USAGE
        return 1;
    }
    
    return 0;
}
