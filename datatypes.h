enum pkgtype{source, patch, meta, binary};
enum license{GPLv1, GPLv2, GPLv3, LGPLv1, LGPLv2, LGPLv21, LGPLv3, BSD, FREEOTHER, OTHER, CCBYSA, ZLIB, PUBLICDOMAIN, OSLv3, MIT, OPENSSL, PSFL, APACHE, APACHEv2};
enum scripts{preinstall, preupdate, dobuild, doinstall, postinstall, postupdate};

struct package {
    char name[];
    char description[];
    char version[];
    char archiveurl[];
    char maintainer[];
    char depends[][];
    char conflicts[][];
    char configurecmd[];
    char configureopts[][];
    enum pkgtype type;
    char sepbuild;
    char uninstallcmd[];
    enum license licenseobj;
    enum scripts scriptsobj[];
}

struct pkglist {
    int pkg_count;
    struct package packages[];
} 

struct ll_node {
    struct package current;
    struct ll_node *next;
    struct ll_node *prev;
}