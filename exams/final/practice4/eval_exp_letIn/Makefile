MPVERSION=eval_exp_letIn
STUDENTSRC=$(MPVERSION).ml
MODULE_COMMON=common
PLSOLUTION=plsolution

OCAMLC=ocamlc
OCAMLLEX=ocamllex
OCAMLYACC=ocamlyacc
GMAKE=make
RM=rm
CP=cp
LN=ln
MV=mv
TAR=tar
GZIP=gzip
MKDIR=mkdir
LATEX=pdflatex

GRADER_NAME=grader

LIBRARY_GRADER=lib/grader.cma
MODULE_STUDENT=student
MODULE_SOLUTION=solution
MODULE_RUBRIC=rubric

OBJLANG=picoml
INTERACTIVE_EXE=$(OBJLANG)Interp

#######################################################################
# DISTFILES define what goes into mpNtest.tgz distributions
#######################################################################

all: $(GRADER_NAME) $(INTERACTIVE_EXE) $(INTERACTIVE_EXE)Sol

$(MPVERSION)-skeleton.ml: $(STUDENTSRC)
	$(CP) $(STUDENTSRC) $(MPVERSION)-skeleton.ml


DISTFILES_SOURCE=pre-rubric.c tests Makefile $(MODULE_COMMON).ml $(INTERACTIVE_EXE).ml $(OBJLANG)parse.mly $(OBJLANG)lex.mll
DISTFILES_OBJECT=$(MODULE_COMMON).cmo $(MODULE_COMMON).cmi $(OBJLANG)parse.cmo $(OBJLANG)parse.cmi $(OBJLANG)lex.cmo $(OBJLANG)lex.cmi $(MODULE_SOLUTION).cmo $(MODULE_SOLUTION).cmi $(PLSOLUTION).cmo $(PLSOLUTION).cmi

IMPLEMENTATIONS= $(MODULE_COMMON).cmo $(OBJLANG)parse.cmo $(OBJLANG)lex.cmo $(PLSOLUTION).cmo $(MODULE_STUDENT).cmo $(MODULE_SOLUTION).cmo 

DISTFILES_OTHER=README $(MPVERSION).ml $(MPVERSION)-skeleton.ml $(MPVERSION).pdf .ocamlinit
DISTFILES=$(DISTFILES_SOURCE) $(DISTFILES_OBJECT) $(DISTFILES_OTHER)

OBJECTS=$(IMPLEMENTATIONS) $(MODULE_RUBRIC).cmo

STUDENT_CLEAN=$(MODULE_STUDENT).cm? $(MODULE_STUDENT).ml $(MODULE_RUBRIC).cm? util.o $(GRADER_NAME) \
        $(INTERACTIVE_EXE) $(INTERACTIVE_EXE)Sol $(INTERACTIVE_EXE)*.cm? $(INTERACTIVE_EXE)2*

$(GRADER_NAME): $(LIBRARY_GRADER) $(OBJECTS)
	$(OCAMLC) -o $(GRADER_NAME) $(LIBRARY_GRADER) $(OBJECTS) 

$(INTERACTIVE_EXE): $(GRADER_NAME) $(INTERACTIVE_EXE).ml
	$(OCAMLC) -c $(INTERACTIVE_EXE).ml
	$(OCAMLC) -o $(INTERACTIVE_EXE) $(IMPLEMENTATIONS) $(INTERACTIVE_EXE).cmo 

$(INTERACTIVE_EXE)Sol: $(GRADER_NAME) $(INTERACTIVE_EXE).ml
	sed 's/Student/Solution/g' $(INTERACTIVE_EXE).ml > $(INTERACTIVE_EXE)2.ml
	$(OCAMLC) -c $(INTERACTIVE_EXE)2.ml
	$(OCAMLC) -o $(INTERACTIVE_EXE)Sol $(IMPLEMENTATIONS) $(INTERACTIVE_EXE)2.cmo

$(LIBRARY_GRADER):
	$(GMAKE) -C lib
	$(LN) -s lib/util.o .

$(MODULE_STUDENT).cmo: $(STUDENTSRC) $(PLSOLUTION).cmo
	$(CP) $(STUDENTSRC) $(MODULE_STUDENT).ml
	$(OCAMLC) -c $(MODULE_STUDENT).ml

########################################################################
# compiling plsolution to give a  separate function for each clause    #
########################################################################

$(PLSOLUTION).cmo:
	$(OCAMLC) -c $(PLSOLUTION).ml

########################################################################
# if solution.ml exists, compile it.  otherwise assume solution.cm{o,i}
# exist.
########################################################################
ifeq "$(wildcard $(MODULE_SOLUTION).ml)" "$(MODULE_SOLUTION).ml"
$(MODULE_COMMON).cmo: $(MODULE_COMMON).ml
	$(OCAMLC) -c $(MODULE_COMMON).ml 
$(OBJLANG)parse.cmo: $(OBJLANG)parse.mly
	$(OCAMLYACC) $(OBJLANG)parse.mly
	$(OCAMLC) -c $(OBJLANG)parse.mli
	$(OCAMLC) -c $(OBJLANG)parse.ml

$(OBJLANG)lex.cmo: $(OBJLANG)lex.mll
	$(OCAMLLEX) $(OBJLANG)lex.mll
	$(OCAMLC) -c $(OBJLANG)lex.ml

$(MODULE_SOLUTION).cmo: $(MODULE_SOLUTION).ml
	$(OCAMLC) -c $(MODULE_SOLUTION).ml
endif

$(MODULE_RUBRIC).cmo: $(MODULE_COMMON).cmi pre-$(MODULE_RUBRIC).c tests $(IMPLEMENTATIONS) $(LIBRARY_GRADER)
	gcc -E pre-$(MODULE_RUBRIC).c | grep -E -v "#" > $(MODULE_RUBRIC).ml
	$(OCAMLC) -c -I lib $(MODULE_RUBRIC).ml
	$(RM) -f $(MODULE_RUBRIC).ml

clean:
	$(GMAKE) -C lib clean
	$(RM) -f $(STUDENT_CLEAN)

##########################################################################
#these targets are used by staff
##########################################################################

TESTNAME=$(MPVERSION)

dist: $(GRADER_NAME) $(DISTFILES)
	$(RM) -rf $(TESTNAME)
	$(MKDIR) $(TESTNAME)
	$(MKDIR) $(TESTNAME)/lib
	$(CP) lib/Makefile lib/*.ml $(TESTNAME)/lib
	$(CP) $(DISTFILES) $(TESTNAME)
	$(TAR) cpf $(TESTNAME).tar $(TESTNAME)
	$(RM) -rf $(TESTNAME)
	$(GZIP) -9 $(TESTNAME).tar

#if you are a student, do not make dist-clean.  it will delete
#your copy of solution.cmo and you will need to download a new
#copy.
dist-clean: clean
	$(RM) -f $(DISTFILES_OBJECT) $(MODULE_STUDENT).*  $(MODULE_COMMON).cm? $(MODULE_RUBRIC).ml 
	$(RM) -f $(OBJLANG)lex.ml $(OBJLANG)lex.cm? $(OBJLANG)parse.cm? $(OBJLANG)parse.ml $(OBJLANG)parse.mli $(INTERACTIVE_EXE).cm? $(INTERACTIVE_EXE) $(INTERACTIVE_EXE).cm* $(INTERACTIVE_EXE)Sol* $(MODULE_SOLUTION).cm?

