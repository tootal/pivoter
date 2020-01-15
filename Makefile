
OBJECT_DIR = obj
SRC_DIR    = src
BIN_DIR    = bin

OBJECTS  = $(OBJECT_DIR)/LinkedList.o
OBJECTS += $(OBJECT_DIR)/MemoryManager.o
OBJECTS += $(OBJECT_DIR)/degeneracy_algorithm_cliques_A.o
OBJECTS += $(OBJECT_DIR)/degeneracy_algorithm_cliques_V.o
OBJECTS += $(OBJECT_DIR)/degeneracy_algorithm_cliques_E.o
OBJECTS += $(OBJECT_DIR)/degeneracy_helper.o
OBJECTS += $(OBJECT_DIR)/misc.o

EXEC_NAMES =  compdegen degeneracy_cliques

EXECS = $(addprefix $(BIN_DIR)/, $(EXEC_NAMES))

VPATH = src

.PHONY : all

all: $(EXECS)

.PHONY : clean

clean: 
	rm -rf $(OBJECTS) $(EXECS) $(OBJECT_DIR) $(BIN_DIR)

$(BIN_DIR)/compdegen: compdegen.c ${OBJECTS} ${BIN_DIR}
	g++ -O3 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/compdegen.c -o $@


$(BIN_DIR)/degeneracy_cliques: degeneracy_cliques.c ${OBJECTS} ${BIN_DIR}
	g++ -O3 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/degeneracy_cliques.c -o $@

# $(BIN_DIR)/degeneracy_maximal_cliques: degeneracy_maximal_cliques.c ${OBJECTS} ${BIN_DIR}
# 	g++ -O3 -g ${DEFINE} ${OBJECTS} $(SRC_DIR)/degeneracy_maximal_cliques.c -o $@


$(OBJECT_DIR)/LinkedList.o: LinkedList.c LinkedList.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/LinkedList.c -o $@

$(OBJECT_DIR)/MemoryManager.o: MemoryManager.c MemoryManager.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/MemoryManager.c -o $@

$(OBJECT_DIR)/degeneracy_algorithm_cliques_A.o: degeneracy_algorithm_cliques_A.c degeneracy_algorithm_cliques_A.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/degeneracy_algorithm_cliques_A.c -o $@

$(OBJECT_DIR)/degeneracy_algorithm_cliques_V.o: degeneracy_algorithm_cliques_V.c degeneracy_algorithm_cliques_V.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/degeneracy_algorithm_cliques_V.c -o $@

$(OBJECT_DIR)/degeneracy_algorithm_cliques_E.o: degeneracy_algorithm_cliques_E.c degeneracy_algorithm_cliques_E.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/degeneracy_algorithm_cliques_E.c -o $@


# $(OBJECT_DIR)/degeneracy_algorithm_maximal_cliques.o: degeneracy_algorithm_maximal_cliques.c degeneracy_algorithm_maximal_cliques.h ${OBJECT_DIR}
# 	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/degeneracy_algorithm_maximal_cliques.c -o $@

$(OBJECT_DIR)/degeneracy_helper.o: degeneracy_helper.c degeneracy_helper.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/degeneracy_helper.c -o $@

$(OBJECT_DIR)/misc.o: misc.c misc.h ${OBJECT_DIR}
	g++ -O3 -g ${DEFINE} -c $(SRC_DIR)/misc.c -o $@ 

${OBJECT_DIR}:
	mkdir ${OBJECT_DIR}

${BIN_DIR}:
	mkdir ${BIN_DIR}
