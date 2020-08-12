include config.mk

PROGBIN = kawa

PROGOBJ = kawa.o
DFSAOBJ = dfs.o
INSTOBJ = install.o
REMVOBJ = remove.o
SRCHOBJ = search.o
SHOWOBJ = show.o
UPDTOBJ = update.o
UPGROBJ = upgrade.o
SAUCOBJ = sourcepkg.o
PATCOBJ = patchpkg.o
BINAOBJ = binarypkg.o
METAOBJ = metapkg.o
DTBSOBJ = database.o
REPOOBJ = reposync.o
DATAOBJ = datatypes.o

all: $(PROGBIN)

$(PROGBIN): $(PROGOBJ)
	$(CC) $(LDFLAGS) -o $@ $(INITOBJ) $(LDLIBS)

$(PROGOBJ): config.h

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(PROGOBJ) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(INITBIN) $(DESTDIR)$(PREFIX)/bin/$(SERVBIN)

dist: clean
	mkdir -p kawa-$(VERSION)
	mkdir -p kawa-$(VERSION)/confs
	cp LICENSE Makefile README config.def.h config.mk kawa.c *.h kawa-$(VERSION)
	tar -cf kawa-$(VERSION).tar kawa-$(VERSION)
	gzip kawa-$(VERSION).tar
	rm -rf kawa-$(VERSION)

clean:
	rm -f $(PROGBIN) $(PROGOBJ) kawa-$(VERSION).tar.gz

.SUFFIXES: .def.h

.def.h.h:
	cp $< $@

.PHONY:
	all install uninstall dist clean
