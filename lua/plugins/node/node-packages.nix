# This file has been generated by node2nix 1.11.1. Do not edit!

{nodeEnv, fetchurl, fetchgit, nix-gitignore, stdenv, lib, globalBuildInputs ? []}:

let
  sources = {
    "@emmetio/abbreviation-2.3.3" = {
      name = "_at_emmetio_slash_abbreviation";
      packageName = "@emmetio/abbreviation";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/abbreviation/-/abbreviation-2.3.3.tgz";
        sha512 = "mgv58UrU3rh4YgbE/TzgLQwJ3pFsHHhCLqY20aJq+9comytTXUDNGG/SMtSeMJdkpxgXSXunBGLD8Boka3JyVA==";
      };
    };
    "@emmetio/css-abbreviation-2.1.8" = {
      name = "_at_emmetio_slash_css-abbreviation";
      packageName = "@emmetio/css-abbreviation";
      version = "2.1.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/css-abbreviation/-/css-abbreviation-2.1.8.tgz";
        sha512 = "s9yjhJ6saOO/uk1V74eifykk2CBYi01STTK3WlXWGOepyKa23ymJ053+DNQjpFcy1ingpaO7AxCcwLvHFY9tuw==";
      };
    };
    "@emmetio/scanner-1.0.4" = {
      name = "_at_emmetio_slash_scanner";
      packageName = "@emmetio/scanner";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@emmetio/scanner/-/scanner-1.0.4.tgz";
        sha512 = "IqRuJtQff7YHHBk4G8YZ45uB9BaAGcwQeVzgj/zj8/UdOhtQpEIupUhSk8dys6spFIWVZVeK20CzGEnqR5SbqA==";
      };
    };
    "@jsdevtools/ez-spawn-3.0.4" = {
      name = "_at_jsdevtools_slash_ez-spawn";
      packageName = "@jsdevtools/ez-spawn";
      version = "3.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/@jsdevtools/ez-spawn/-/ez-spawn-3.0.4.tgz";
        sha512 = "f5DRIOZf7wxogefH03RjMPMdBF7ADTWUMoOs9kaJo06EfwF+aFhMZMDZxHg/Xe12hptN9xoZjGso2fdjapBRIA==";
      };
    };
    "@nodelib/fs.scandir-2.1.5" = {
      name = "_at_nodelib_slash_fs.scandir";
      packageName = "@nodelib/fs.scandir";
      version = "2.1.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.scandir/-/fs.scandir-2.1.5.tgz";
        sha512 = "vq24Bq3ym5HEQm2NKCr3yXDwjc7vTsEThRDnkp2DK9p1uqLR+DHurm/NOTo0KG7HYHU7eppKZj3MyqYuMBf62g==";
      };
    };
    "@nodelib/fs.stat-2.0.5" = {
      name = "_at_nodelib_slash_fs.stat";
      packageName = "@nodelib/fs.stat";
      version = "2.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.stat/-/fs.stat-2.0.5.tgz";
        sha512 = "RkhPPp2zrqDAQA/2jNhnztcPAlv64XdhIp7a7454A5ovI7Bukxgt7MX7udwAu3zg1DcpPU0rz3VV1SeaqvY4+A==";
      };
    };
    "@nodelib/fs.walk-1.2.8" = {
      name = "_at_nodelib_slash_fs.walk";
      packageName = "@nodelib/fs.walk";
      version = "1.2.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/@nodelib/fs.walk/-/fs.walk-1.2.8.tgz";
        sha512 = "oGB+UxlgWcgQkgwo8GcEGwemoTFt3FIO9ababBmaGwXIoBKZ+GTy0pP185beGg7Llih/NSHSV2XAs1lnznocSg==";
      };
    };
    "@vscode/emmet-helper-2.9.2" = {
      name = "_at_vscode_slash_emmet-helper";
      packageName = "@vscode/emmet-helper";
      version = "2.9.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/@vscode/emmet-helper/-/emmet-helper-2.9.2.tgz";
        sha512 = "MaGuyW+fa13q3aYsluKqclmh62Hgp0BpKIqS66fCxfOaBcVQ1OnMQxRRgQUYnCkxFISAQlkJ0qWWPyXjro1Qrg==";
      };
    };
    "acorn-8.10.0" = {
      name = "acorn";
      packageName = "acorn";
      version = "8.10.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/acorn/-/acorn-8.10.0.tgz";
        sha512 = "F0SAmZ8iUtS//m8DmCTA0jlh6TDKkHQyK6xc6V4KDTyZKA9dnvX9/3sRTVQrWm79glUAZbnmmNcdYwUIHWVybw==";
      };
    };
    "agent-base-6.0.2" = {
      name = "agent-base";
      packageName = "agent-base";
      version = "6.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/agent-base/-/agent-base-6.0.2.tgz";
        sha512 = "RZNwNclF7+MS/8bDg70amg32dyeZGZxiDuQmZxKLAlQjr3jGyLx+4Kkk58UO7D2QdgFIQCovuSuZESne6RG6XQ==";
      };
    };
    "anymatch-3.1.3" = {
      name = "anymatch";
      packageName = "anymatch";
      version = "3.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/anymatch/-/anymatch-3.1.3.tgz";
        sha512 = "KMReFUr0B4t+D+OBkjR3KYqvocp2XaSzO55UcB6mgQMd3KbcE+mWTyvVV7D/zsdEbNnV6acZUutkiHQXvTr1Rw==";
      };
    };
    "binary-extensions-2.2.0" = {
      name = "binary-extensions";
      packageName = "binary-extensions";
      version = "2.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/binary-extensions/-/binary-extensions-2.2.0.tgz";
        sha512 = "jDctJ/IVQbZoJykoeHbhXpOlNBqGNcwXJKJog42E5HDPUwQTSdjCHdihjj0DlnheQ7blbT6dHOafNAiS8ooQKA==";
      };
    };
    "braces-3.0.2" = {
      name = "braces";
      packageName = "braces";
      version = "3.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/braces/-/braces-3.0.2.tgz";
        sha512 = "b8um+L1RzM3WDSzvhm6gIz1yfTbBt6YTlcEKAvsmqCZZFw46z626lVj9j1yEPW33H5H+lBQpZMP1k8l+78Ha0A==";
      };
    };
    "bumpp-9.2.0" = {
      name = "bumpp";
      packageName = "bumpp";
      version = "9.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/bumpp/-/bumpp-9.2.0.tgz";
        sha512 = "pgp7y3jp33QTaXFVDrE0IKuZF5Y8EsIz+ywZXFALW2nD+ZD+4crxJe/GypBQBoJuZrr5dc6TGrR3wl7fk3+C6w==";
      };
    };
    "c12-1.4.2" = {
      name = "c12";
      packageName = "c12";
      version = "1.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/c12/-/c12-1.4.2.tgz";
        sha512 = "3IP/MuamSVRVw8W8+CHWAz9gKN4gd+voF2zm/Ln6D25C2RhytEZ1ABbC8MjKr4BR9rhoV1JQ7jJA158LDiTkLg==";
      };
    };
    "cac-6.7.14" = {
      name = "cac";
      packageName = "cac";
      version = "6.7.14";
      src = fetchurl {
        url = "https://registry.npmjs.org/cac/-/cac-6.7.14.tgz";
        sha512 = "b6Ilus+c3RrdDk+JhLKUAQfzzgLEPy6wcXqS7f/xe1EETvsDP6GORG7SFuOs6cID5YkqchW/LXZbX5bc8j7ZcQ==";
      };
    };
    "call-me-maybe-1.0.2" = {
      name = "call-me-maybe";
      packageName = "call-me-maybe";
      version = "1.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/call-me-maybe/-/call-me-maybe-1.0.2.tgz";
        sha512 = "HpX65o1Hnr9HH25ojC1YGs7HCQLq0GCOibSaWER0eNpgJ/Z1MZv2mTc7+xh6WOPxbRVcmgbv4hGU+uSQ/2xFZQ==";
      };
    };
    "chokidar-3.5.3" = {
      name = "chokidar";
      packageName = "chokidar";
      version = "3.5.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/chokidar/-/chokidar-3.5.3.tgz";
        sha512 = "Dr3sfKRP6oTcjf2JmUmFJfeVMvXBdegxB0iVQ5eb2V10uFJUCAS8OByZdVAyVb8xXNz3GjjTgj9kLWsZTqE6kw==";
      };
    };
    "chownr-2.0.0" = {
      name = "chownr";
      packageName = "chownr";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/chownr/-/chownr-2.0.0.tgz";
        sha512 = "bIomtDF5KGpdogkLd9VspvFzk9KfpyyGlS8YFVZl7TGPBHL5snIOnxeshwVgPteQ9b4Eydl+pVbIyE1DcvCWgQ==";
      };
    };
    "colorette-2.0.20" = {
      name = "colorette";
      packageName = "colorette";
      version = "2.0.20";
      src = fetchurl {
        url = "https://registry.npmjs.org/colorette/-/colorette-2.0.20.tgz";
        sha512 = "IfEDxwoWIjkeXL1eXcDiow4UbKjhLdq6/EuSVR9GMN7KVH3r9gQ83e73hsz1Nd1T3ijd5xv1wcWRYO+D6kCI2w==";
      };
    };
    "cross-spawn-7.0.3" = {
      name = "cross-spawn";
      packageName = "cross-spawn";
      version = "7.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/cross-spawn/-/cross-spawn-7.0.3.tgz";
        sha512 = "iRDPJKUPVEND7dHPO8rkbOnPpyDygcDFtWjpeWNCgy8WP2rXcxXL8TskReQl6OrB2G7+UJrags1q15Fudc7G6w==";
      };
    };
    "debug-4.3.4" = {
      name = "debug";
      packageName = "debug";
      version = "4.3.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/debug/-/debug-4.3.4.tgz";
        sha512 = "PRWFHuSU3eDtQJPvnNY7Jcket1j0t5OuOsFzPPzsekD52Zl8qUfFIPEiswXqIvHWGVHOgX+7G/vCNNhehwxfkQ==";
      };
    };
    "defu-6.1.2" = {
      name = "defu";
      packageName = "defu";
      version = "6.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/defu/-/defu-6.1.2.tgz";
        sha512 = "+uO4+qr7msjNNWKYPHqN/3+Dx3NFkmIzayk2L1MyZQlvgZb/J1A0fo410dpKrN2SnqFjt8n4JL8fDJE0wIgjFQ==";
      };
    };
    "destr-2.0.1" = {
      name = "destr";
      packageName = "destr";
      version = "2.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/destr/-/destr-2.0.1.tgz";
        sha512 = "M1Ob1zPSIvlARiJUkKqvAZ3VAqQY6Jcuth/pBKQ2b1dX/Qx0OnJ8Vux6J2H5PTMQeRzWrrbTu70VxBfv/OPDJA==";
      };
    };
    "dotenv-16.3.1" = {
      name = "dotenv";
      packageName = "dotenv";
      version = "16.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/dotenv/-/dotenv-16.3.1.tgz";
        sha512 = "IPzF4w4/Rd94bA9imS68tZBaYyBWSCE47V1RGuMrB94iyTOIEwRmVL2x/4An+6mETpLrKJ5hQkB8W4kFAadeIQ==";
      };
    };
    "emmet-2.4.6" = {
      name = "emmet";
      packageName = "emmet";
      version = "2.4.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/emmet/-/emmet-2.4.6.tgz";
        sha512 = "dJfbdY/hfeTyf/Ef7Y7ubLYzkBvPQ912wPaeVYpAxvFxkEBf/+hJu4H6vhAvFN6HlxqedlfVn2x1S44FfQ97pg==";
      };
    };
    "fast-glob-3.3.1" = {
      name = "fast-glob";
      packageName = "fast-glob";
      version = "3.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fast-glob/-/fast-glob-3.3.1.tgz";
        sha512 = "kNFPyjhh5cKjrUltxs+wFx+ZkbRaxxmZ+X0ZU31SOsxCEtP9VPgtq2teZw1DebupL5GmDaNQ6yKMMVcM41iqDg==";
      };
    };
    "fastq-1.15.0" = {
      name = "fastq";
      packageName = "fastq";
      version = "1.15.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fastq/-/fastq-1.15.0.tgz";
        sha512 = "wBrocU2LCXXa+lWBt8RoIRD89Fi8OdABODa/kEnyeyjS5aZO5/GNvI5sEINADqP/h8M29UHTHUb53sUu5Ihqdw==";
      };
    };
    "fill-range-7.0.1" = {
      name = "fill-range";
      packageName = "fill-range";
      version = "7.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/fill-range/-/fill-range-7.0.1.tgz";
        sha512 = "qOo9F+dMUmC2Lcb4BbVvnKJxTPjCm+RRpe4gDuGrzkL7mEVl/djYSu2OdQ2Pa302N4oqkSg9ir6jaLWJ2USVpQ==";
      };
    };
    "flat-5.0.2" = {
      name = "flat";
      packageName = "flat";
      version = "5.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/flat/-/flat-5.0.2.tgz";
        sha512 = "b6suED+5/3rTpUBdG1gupIl8MPFCAMA0QXwmljLhvCUKcUvdE4gWky9zpuGCcXHOsz4J9wPGNWq6OKpmIzz3hQ==";
      };
    };
    "fs-minipass-2.1.0" = {
      name = "fs-minipass";
      packageName = "fs-minipass";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/fs-minipass/-/fs-minipass-2.1.0.tgz";
        sha512 = "V/JgOLFCS+R6Vcq0slCuaeWEdNC3ouDlJMNIsacH2VtALiu9mV4LPrHc5cDl8k5aw6J8jwgWWpiTo5RYhmIzvg==";
      };
    };
    "fsevents-2.3.3" = {
      name = "fsevents";
      packageName = "fsevents";
      version = "2.3.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/fsevents/-/fsevents-2.3.3.tgz";
        sha512 = "5xoDfX+fL7faATnagmWPpbFtwh/R77WmMMqqHGS65C3vvB0YHrgF+B1YmZ3441tMj5n63k0212XNoJwzlhffQw==";
      };
    };
    "giget-1.1.2" = {
      name = "giget";
      packageName = "giget";
      version = "1.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/giget/-/giget-1.1.2.tgz";
        sha512 = "HsLoS07HiQ5oqvObOI+Qb2tyZH4Gj5nYGfF9qQcZNrPw+uEFhdXtgJr01aO2pWadGHucajYDLxxbtQkm97ON2A==";
      };
    };
    "glob-parent-5.1.2" = {
      name = "glob-parent";
      packageName = "glob-parent";
      version = "5.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/glob-parent/-/glob-parent-5.1.2.tgz";
        sha512 = "AOIgSQCepiJYwP3ARnGx+5VnTu2HBYdzbGP45eLw1vr3zB3vZLeyed1sC9hnbcOc9/SrMyM5RPQrkGz4aS9Zow==";
      };
    };
    "https-proxy-agent-5.0.1" = {
      name = "https-proxy-agent";
      packageName = "https-proxy-agent";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/https-proxy-agent/-/https-proxy-agent-5.0.1.tgz";
        sha512 = "dFcAjpTQFgoLMzC2VwU+C/CbS7uRL0lWmxDITmqm7C+7F0Odmj6s9l6alZc6AELXhrnggM2CeWSXHGOdX2YtwA==";
      };
    };
    "is-binary-path-2.1.0" = {
      name = "is-binary-path";
      packageName = "is-binary-path";
      version = "2.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-binary-path/-/is-binary-path-2.1.0.tgz";
        sha512 = "ZMERYes6pDydyuGidse7OsHxtbI7WVeUEozgR/g7rd0xUimYNlvZRE/K2MgZTjWy725IfelLeVcEM97mmtRGXw==";
      };
    };
    "is-extglob-2.1.1" = {
      name = "is-extglob";
      packageName = "is-extglob";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-extglob/-/is-extglob-2.1.1.tgz";
        sha512 = "SbKbANkN603Vi4jEZv49LeVJMn4yGwsbzZworEoyEiutsN3nJYdbO36zfhGJ6QEDpOZIFkDtnq5JRxmvl3jsoQ==";
      };
    };
    "is-glob-4.0.3" = {
      name = "is-glob";
      packageName = "is-glob";
      version = "4.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-glob/-/is-glob-4.0.3.tgz";
        sha512 = "xelSayHH36ZgE7ZWhli7pW34hNbNl8Ojv5KVmkJD4hBdD3th8Tfk9vYasLM+mXWOZhFkgZfxhLSnrwRr4elSSg==";
      };
    };
    "is-number-7.0.0" = {
      name = "is-number";
      packageName = "is-number";
      version = "7.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/is-number/-/is-number-7.0.0.tgz";
        sha512 = "41Cifkg6e8TylSpdtTpeLVMqvSBEVzTttHvERD741+pnZ8ANv0004MRL43QKPDlK9cGvNp6NZWZUBlbGXYxxng==";
      };
    };
    "isexe-2.0.0" = {
      name = "isexe";
      packageName = "isexe";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/isexe/-/isexe-2.0.0.tgz";
        sha512 = "RHxMLp9lnKHGHRng9QFhRCMbYAcVpn69smSGcq3f36xjgVVWThj4qqLbTLlq7Ssj8B+fIQ1EuCEGI2lKsyQeIw==";
      };
    };
    "jiti-1.20.0" = {
      name = "jiti";
      packageName = "jiti";
      version = "1.20.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/jiti/-/jiti-1.20.0.tgz";
        sha512 = "3TV69ZbrvV6U5DfQimop50jE9Dl6J8O1ja1dvBbMba/sZ3YBEQqJ2VZRoQPVnhlzjNtU1vaXRZVrVjU4qtm8yA==";
      };
    };
    "jsonc-parser-2.3.1" = {
      name = "jsonc-parser";
      packageName = "jsonc-parser";
      version = "2.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonc-parser/-/jsonc-parser-2.3.1.tgz";
        sha512 = "H8jvkz1O50L3dMZCsLqiuB2tA7muqbSg1AtGEkN0leAqGjsUzDJir3Zwr02BhqdcITPg3ei3mZ+HjMocAknhhg==";
      };
    };
    "jsonc-parser-3.2.0" = {
      name = "jsonc-parser";
      packageName = "jsonc-parser";
      version = "3.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/jsonc-parser/-/jsonc-parser-3.2.0.tgz";
        sha512 = "gfFQZrcTc8CnKXp6Y4/CBT3fTc0OVuDofpre4aEeEpSBPV5X5v4+Vmx+8snU7RLPrNHPKSgLxGo9YuQzz20o+w==";
      };
    };
    "kleur-3.0.3" = {
      name = "kleur";
      packageName = "kleur";
      version = "3.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/kleur/-/kleur-3.0.3.tgz";
        sha512 = "eTIzlVOSUR+JxdDFepEYcBMtZ9Qqdef+rnzWdRZuMbOywu5tO2w2N7rqjoANZ5k9vywhL6Br1VRjUIgTQx4E8w==";
      };
    };
    "lru-cache-6.0.0" = {
      name = "lru-cache";
      packageName = "lru-cache";
      version = "6.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/lru-cache/-/lru-cache-6.0.0.tgz";
        sha512 = "Jo6dJ04CmSjuznwJSS3pUeWmd/H0ffTlkXXgwZi+eq1UCmqQwCh+eLsYOYCwY991i2Fah4h1BEMCx4qThGbsiA==";
      };
    };
    "merge2-1.4.1" = {
      name = "merge2";
      packageName = "merge2";
      version = "1.4.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/merge2/-/merge2-1.4.1.tgz";
        sha512 = "8q7VEgMJW4J8tcfVPy8g09NcQwZdbwFEqhe/WZkoIzjn/3TGDwtOCYtXGxA3O8tPzpczCCDgv+P2P5y00ZJOOg==";
      };
    };
    "micromatch-4.0.5" = {
      name = "micromatch";
      packageName = "micromatch";
      version = "4.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/micromatch/-/micromatch-4.0.5.tgz";
        sha512 = "DMy+ERcEW2q8Z2Po+WNXuw3c5YaUSFjAO5GsJqfEl7UjvtIuFKO6ZrKvcItdy98dwFI2N1tg3zNIdKaQT+aNdA==";
      };
    };
    "minipass-3.3.6" = {
      name = "minipass";
      packageName = "minipass";
      version = "3.3.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/minipass/-/minipass-3.3.6.tgz";
        sha512 = "DxiNidxSEK+tHG6zOIklvNOwm3hvCrbUrdtzY74U6HKTJxvIDfOUL5W5P2Ghd3DTkhhKPYGqeNUIh5qcM4YBfw==";
      };
    };
    "minipass-5.0.0" = {
      name = "minipass";
      packageName = "minipass";
      version = "5.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/minipass/-/minipass-5.0.0.tgz";
        sha512 = "3FnjYuehv9k6ovOEbyOswadCDPX1piCfhV8ncmYtHOjuPwylVWsghTLo7rabjC3Rx5xD4HDx8Wm1xnMF7S5qFQ==";
      };
    };
    "minizlib-2.1.2" = {
      name = "minizlib";
      packageName = "minizlib";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/minizlib/-/minizlib-2.1.2.tgz";
        sha512 = "bAxsR8BVfj60DWXHE3u30oHzfl4G7khkSuPW+qvpd7jFRHm7dLxOjUk1EHACJ/hxLY8phGJ0YhYHZo7jil7Qdg==";
      };
    };
    "mkdirp-1.0.4" = {
      name = "mkdirp";
      packageName = "mkdirp";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/mkdirp/-/mkdirp-1.0.4.tgz";
        sha512 = "vVqVZQyf3WLx2Shd0qJ9xuvqgAyKPLAiqITEtqW0oIUjzo3PePDd6fW9iFz30ef7Ysp/oiWqbhszeGWW2T6Gzw==";
      };
    };
    "mlly-1.4.2" = {
      name = "mlly";
      packageName = "mlly";
      version = "1.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/mlly/-/mlly-1.4.2.tgz";
        sha512 = "i/Ykufi2t1EZ6NaPLdfnZk2AX8cs0d+mTzVKuPfqPKPatxLApaBoxJQ9x1/uckXtrS/U5oisPMDkNs0yQTaBRg==";
      };
    };
    "mri-1.2.0" = {
      name = "mri";
      packageName = "mri";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mri/-/mri-1.2.0.tgz";
        sha512 = "tzzskb3bG8LvYGFF/mDTpq3jpI6Q9wc3LEmBaghu+DdCssd1FakN7Bc0hVNmEyGq1bq3RgfkCb3cmQLpNPOroA==";
      };
    };
    "ms-2.1.2" = {
      name = "ms";
      packageName = "ms";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/ms/-/ms-2.1.2.tgz";
        sha512 = "sGkPx+VjMtmA6MX27oA4FBFELFCZZ4S4XqeGOXCv68tT+jb3vk/RyaKWP0PTKyWtmLSM0b+adUTEvbs1PEaH2w==";
      };
    };
    "node-fetch-native-1.4.0" = {
      name = "node-fetch-native";
      packageName = "node-fetch-native";
      version = "1.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-fetch-native/-/node-fetch-native-1.4.0.tgz";
        sha512 = "F5kfEj95kX8tkDhUCYdV8dg3/8Olx/94zB8+ZNthFs6Bz31UpUi8Xh40TN3thLwXgrwXry1pEg9lJ++tLWTcqA==";
      };
    };
    "normalize-path-3.0.0" = {
      name = "normalize-path";
      packageName = "normalize-path";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/normalize-path/-/normalize-path-3.0.0.tgz";
        sha512 = "6eZs5Ls3WtCisHWp9S2GUy8dqkpGi4BVSz3GaqiE6ezub0512ESztXUwUB6C6IKbQkY2Pnb/mD4WYojCRwcwLA==";
      };
    };
    "ohash-1.1.3" = {
      name = "ohash";
      packageName = "ohash";
      version = "1.1.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/ohash/-/ohash-1.1.3.tgz";
        sha512 = "zuHHiGTYTA1sYJ/wZN+t5HKZaH23i4yI1HMwbuXm24Nid7Dv0KcuRlKoNKS9UNfAVSBlnGLcuQrnOKWOZoEGaw==";
      };
    };
    "path-key-3.1.1" = {
      name = "path-key";
      packageName = "path-key";
      version = "3.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/path-key/-/path-key-3.1.1.tgz";
        sha512 = "ojmeN0qd+y0jszEtoY48r0Peq5dwMEkIlCOu6Q5f41lfkswXuKtYrhgoTpLnyIcHm24Uhqx+5Tqm2InSwLhE6Q==";
      };
    };
    "pathe-1.1.1" = {
      name = "pathe";
      packageName = "pathe";
      version = "1.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/pathe/-/pathe-1.1.1.tgz";
        sha512 = "d+RQGp0MAYTIaDBIMmOfMwz3E+LOZnxx1HZd5R18mmCZY0QBlK0LDZfPc8FW8Ed2DlvsuE6PRjroDY+wg4+j/Q==";
      };
    };
    "perfect-debounce-1.0.0" = {
      name = "perfect-debounce";
      packageName = "perfect-debounce";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/perfect-debounce/-/perfect-debounce-1.0.0.tgz";
        sha512 = "xCy9V055GLEqoFaHoC1SoLIaLmWctgCUaBaWxDZ7/Zx4CTyX7cJQLJOok/orfjZAh9kEYpjJa4d0KcJmCbctZA==";
      };
    };
    "picomatch-2.3.1" = {
      name = "picomatch";
      packageName = "picomatch";
      version = "2.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/picomatch/-/picomatch-2.3.1.tgz";
        sha512 = "JU3teHTNjmE2VCGFzuY8EXzCDVwEqB2a8fsIvwaStHhAWJEeVd1o1QD80CU6+ZdEXXSLbSsuLwJjkCBWqRQUVA==";
      };
    };
    "pkg-types-1.0.3" = {
      name = "pkg-types";
      packageName = "pkg-types";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/pkg-types/-/pkg-types-1.0.3.tgz";
        sha512 = "nN7pYi0AQqJnoLPC9eHFQ8AcyaixBUOwvqc5TDnIKCMEE6I0y8P7OKA7fPexsXGCGxQDl/cmrLAp26LhcwxZ4A==";
      };
    };
    "prompts-2.4.2" = {
      name = "prompts";
      packageName = "prompts";
      version = "2.4.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/prompts/-/prompts-2.4.2.tgz";
        sha512 = "NxNv/kLguCA7p3jE8oL2aEBsrJWgAakBpgmgK6lpPWV+WuOmY6r2/zbAVnP+T8bQlA0nzHXSJSJW0Hq7ylaD2Q==";
      };
    };
    "queue-microtask-1.2.3" = {
      name = "queue-microtask";
      packageName = "queue-microtask";
      version = "1.2.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/queue-microtask/-/queue-microtask-1.2.3.tgz";
        sha512 = "NuaNSa6flKT5JaSYQzJok04JzTL1CA6aGhv5rfLW3PgqA+M2ChpZQnAC8h8i4ZFkBS8X5RqkDBHA7r4hej3K9A==";
      };
    };
    "rc9-2.1.1" = {
      name = "rc9";
      packageName = "rc9";
      version = "2.1.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/rc9/-/rc9-2.1.1.tgz";
        sha512 = "lNeOl38Ws0eNxpO3+wD1I9rkHGQyj1NU1jlzv4go2CtEnEQEUfqnIvZG7W+bC/aXdJ27n5x/yUjb6RoT9tko+Q==";
      };
    };
    "readdirp-3.6.0" = {
      name = "readdirp";
      packageName = "readdirp";
      version = "3.6.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/readdirp/-/readdirp-3.6.0.tgz";
        sha512 = "hOS089on8RduqdbhvQ5Z37A0ESjsqz6qnRcffsMU3495FuTdqSm+7bhJ29JvIOsBDEEnan5DPu9t3To9VRlMzA==";
      };
    };
    "reusify-1.0.4" = {
      name = "reusify";
      packageName = "reusify";
      version = "1.0.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/reusify/-/reusify-1.0.4.tgz";
        sha512 = "U9nH88a3fc/ekCF1l0/UP1IosiuIjyTh7hBvXVMHYgVcfGvt897Xguj2UOLDeI5BG2m7/uwyaLVT6fbtCwTyzw==";
      };
    };
    "run-parallel-1.2.0" = {
      name = "run-parallel";
      packageName = "run-parallel";
      version = "1.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/run-parallel/-/run-parallel-1.2.0.tgz";
        sha512 = "5l4VyZR86LZ/lDxZTR6jqL8AFE2S0IFLMP26AbjsLVADxHdhB/c0GUsH+y39UfCi3dzz8OlQuPmnaJOMoDHQBA==";
      };
    };
    "semver-7.5.4" = {
      name = "semver";
      packageName = "semver";
      version = "7.5.4";
      src = fetchurl {
        url = "https://registry.npmjs.org/semver/-/semver-7.5.4.tgz";
        sha512 = "1bCSESV6Pv+i21Hvpxp3Dx+pSD8lIPt8uVjRrxAUt/nbswYc+tK6Y2btiULjd4+fnq15PX+nqQDC7Oft7WkwcA==";
      };
    };
    "shebang-command-2.0.0" = {
      name = "shebang-command";
      packageName = "shebang-command";
      version = "2.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-command/-/shebang-command-2.0.0.tgz";
        sha512 = "kHxr2zZpYtdmrN1qDjrrX/Z1rR1kG8Dx+gkpK1G4eXmvXswmcE1hTWBWYUzlraYw1/yZp6YuDY77YtvbN0dmDA==";
      };
    };
    "shebang-regex-3.0.0" = {
      name = "shebang-regex";
      packageName = "shebang-regex";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/shebang-regex/-/shebang-regex-3.0.0.tgz";
        sha512 = "7++dFhtcx3353uBaq8DDR4NuxBetBzC7ZQOhmTQInHEd6bSrXdiEyzCvG07Z44UYdLShWUyXt5M/yhz8ekcb1A==";
      };
    };
    "sisteransi-1.0.5" = {
      name = "sisteransi";
      packageName = "sisteransi";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/sisteransi/-/sisteransi-1.0.5.tgz";
        sha512 = "bLGGlR1QxBcynn2d5YmDX4MGjlZvy2MRBDRNHLJ8VI6l6+9FUiyTFNJ0IveOSP0bcXgVDPRcfGqA0pjaqUpfVg==";
      };
    };
    "string-argv-0.3.2" = {
      name = "string-argv";
      packageName = "string-argv";
      version = "0.3.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/string-argv/-/string-argv-0.3.2.tgz";
        sha512 = "aqD2Q0144Z+/RqG52NeHEkZauTAUWJO8c6yTftGJKO3Tja5tUgIfmIl6kExvhtxSDP7fXB6DvzkfMpCd/F3G+Q==";
      };
    };
    "tar-6.2.0" = {
      name = "tar";
      packageName = "tar";
      version = "6.2.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/tar/-/tar-6.2.0.tgz";
        sha512 = "/Wo7DcT0u5HUV486xg675HtjNd3BXZ6xDbzsCUZPt5iw8bTQ63bP0Raut3mvro9u+CUyq7YQd8Cx55fsZXxqLQ==";
      };
    };
    "to-regex-range-5.0.1" = {
      name = "to-regex-range";
      packageName = "to-regex-range";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/to-regex-range/-/to-regex-range-5.0.1.tgz";
        sha512 = "65P7iz6X5yEr1cwcgvQxbbIw7Uk3gOy5dIdtZ4rDveLqhrdJP+Li/Hx6tyK0NEb+2GCyneCMJiGqrADCSNk8sQ==";
      };
    };
    "type-detect-4.0.8" = {
      name = "type-detect";
      packageName = "type-detect";
      version = "4.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/type-detect/-/type-detect-4.0.8.tgz";
        sha512 = "0fr/mIH1dlO+x7TlcMy+bIDqKPsw/70tVyeHW787goQjhmqaZe10uwLujubK9q9Lg6Fiho1KUKDYz0Z7k7g5/g==";
      };
    };
    "ufo-1.3.1" = {
      name = "ufo";
      packageName = "ufo";
      version = "1.3.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/ufo/-/ufo-1.3.1.tgz";
        sha512 = "uY/99gMLIOlJPwATcMVYfqDSxUR9//AUcgZMzwfSTJPDKzA1S8mX4VLqa+fiAtveraQUBCz4FFcwVZBGbwBXIw==";
      };
    };
    "vscode-jsonrpc-8.1.0" = {
      name = "vscode-jsonrpc";
      packageName = "vscode-jsonrpc";
      version = "8.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-jsonrpc/-/vscode-jsonrpc-8.1.0.tgz";
        sha512 = "6TDy/abTQk+zDGYazgbIPc+4JoXdwC8NHU9Pbn4UJP1fehUyZmM4RHp5IthX7A6L5KS30PRui+j+tbbMMMafdw==";
      };
    };
    "vscode-languageserver-8.1.0" = {
      name = "vscode-languageserver";
      packageName = "vscode-languageserver";
      version = "8.1.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver/-/vscode-languageserver-8.1.0.tgz";
        sha512 = "eUt8f1z2N2IEUDBsKaNapkz7jl5QpskN2Y0G01T/ItMxBxw1fJwvtySGB9QMecatne8jFIWJGWI61dWjyTLQsw==";
      };
    };
    "vscode-languageserver-protocol-3.17.3" = {
      name = "vscode-languageserver-protocol";
      packageName = "vscode-languageserver-protocol";
      version = "3.17.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-protocol/-/vscode-languageserver-protocol-3.17.3.tgz";
        sha512 = "924/h0AqsMtA5yK22GgMtCYiMdCOtWTSGgUOkgEDX+wk2b0x4sAfLiO4NxBxqbiVtz7K7/1/RgVrVI0NClZwqA==";
      };
    };
    "vscode-languageserver-textdocument-1.0.11" = {
      name = "vscode-languageserver-textdocument";
      packageName = "vscode-languageserver-textdocument";
      version = "1.0.11";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-textdocument/-/vscode-languageserver-textdocument-1.0.11.tgz";
        sha512 = "X+8T3GoiwTVlJbicx/sIAF+yuJAqz8VvwJyoMVhwEMoEKE/fkDmrqUgDMyBECcM2A2frVZIUj5HI/ErRXCfOeA==";
      };
    };
    "vscode-languageserver-types-3.17.3" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.17.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.17.3.tgz";
        sha512 = "SYU4z1dL0PyIMd4Vj8YOqFvHu7Hz/enbWtpfnVbJHU4Nd1YNYx8u0ennumc6h48GQNeOLxmwySmnADouT/AuZA==";
      };
    };
    "vscode-languageserver-types-3.17.5" = {
      name = "vscode-languageserver-types";
      packageName = "vscode-languageserver-types";
      version = "3.17.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-languageserver-types/-/vscode-languageserver-types-3.17.5.tgz";
        sha512 = "Ld1VelNuX9pdF39h2Hgaeb5hEZM2Z3jUrrMgWQAu82jMtZp7p3vJT3BzToKtZI7NgQssZje5o0zryOrhQvzQAg==";
      };
    };
    "vscode-uri-2.1.2" = {
      name = "vscode-uri";
      packageName = "vscode-uri";
      version = "2.1.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/vscode-uri/-/vscode-uri-2.1.2.tgz";
        sha512 = "8TEXQxlldWAuIODdukIb+TR5s+9Ds40eSJrw+1iDDA9IFORPjMELarNQE3myz5XIkWWpdprmJjm1/SxMlWOC8A==";
      };
    };
    "which-2.0.2" = {
      name = "which";
      packageName = "which";
      version = "2.0.2";
      src = fetchurl {
        url = "https://registry.npmjs.org/which/-/which-2.0.2.tgz";
        sha512 = "BLI3Tl1TW3Pvl70l3yq3Y64i+awpwXqsGBYWkkqMtnbXgrMD+yj7rhW0kuEDxzJaYXGjEW5ogapKNMEKNMjibA==";
      };
    };
    "yallist-4.0.0" = {
      name = "yallist";
      packageName = "yallist";
      version = "4.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/yallist/-/yallist-4.0.0.tgz";
        sha512 = "3wdGidZyq5PB084XLES5TpOSRA3wjXAlIWMhum2kRcv/41Sn2emQ0dycQW4uZXLejwKvg6EsvbdlVL+FYEct7A==";
      };
    };
  };
in
{
  "@olrtg/emmet-language-server" = nodeEnv.buildNodePackage {
    name = "_at_olrtg_slash_emmet-language-server";
    packageName = "@olrtg/emmet-language-server";
    version = "2.3.0";
    src = fetchurl {
      url = "https://registry.npmjs.org/@olrtg/emmet-language-server/-/emmet-language-server-2.3.0.tgz";
      sha512 = "B9A5gZwOEske7YNvZhWx4DA/nrLvqgjUGB/dEcT2t4l5exSgzjaKiozjGbrwsMuZ+0T7oYzdYWJNB3tRc/fsPg==";
    };
    dependencies = [
      sources."@emmetio/abbreviation-2.3.3"
      sources."@emmetio/css-abbreviation-2.1.8"
      sources."@emmetio/scanner-1.0.4"
      sources."@jsdevtools/ez-spawn-3.0.4"
      sources."@nodelib/fs.scandir-2.1.5"
      sources."@nodelib/fs.stat-2.0.5"
      sources."@nodelib/fs.walk-1.2.8"
      sources."@vscode/emmet-helper-2.9.2"
      sources."acorn-8.10.0"
      sources."agent-base-6.0.2"
      sources."anymatch-3.1.3"
      sources."binary-extensions-2.2.0"
      sources."braces-3.0.2"
      sources."bumpp-9.2.0"
      sources."c12-1.4.2"
      sources."cac-6.7.14"
      sources."call-me-maybe-1.0.2"
      sources."chokidar-3.5.3"
      sources."chownr-2.0.0"
      sources."colorette-2.0.20"
      sources."cross-spawn-7.0.3"
      sources."debug-4.3.4"
      sources."defu-6.1.2"
      sources."destr-2.0.1"
      sources."dotenv-16.3.1"
      sources."emmet-2.4.6"
      sources."fast-glob-3.3.1"
      sources."fastq-1.15.0"
      sources."fill-range-7.0.1"
      sources."flat-5.0.2"
      (sources."fs-minipass-2.1.0" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."fsevents-2.3.3"
      sources."giget-1.1.2"
      sources."glob-parent-5.1.2"
      sources."https-proxy-agent-5.0.1"
      sources."is-binary-path-2.1.0"
      sources."is-extglob-2.1.1"
      sources."is-glob-4.0.3"
      sources."is-number-7.0.0"
      sources."isexe-2.0.0"
      sources."jiti-1.20.0"
      sources."jsonc-parser-2.3.1"
      sources."kleur-3.0.3"
      sources."lru-cache-6.0.0"
      sources."merge2-1.4.1"
      sources."micromatch-4.0.5"
      sources."minipass-5.0.0"
      (sources."minizlib-2.1.2" // {
        dependencies = [
          sources."minipass-3.3.6"
        ];
      })
      sources."mkdirp-1.0.4"
      sources."mlly-1.4.2"
      sources."mri-1.2.0"
      sources."ms-2.1.2"
      sources."node-fetch-native-1.4.0"
      sources."normalize-path-3.0.0"
      sources."ohash-1.1.3"
      sources."path-key-3.1.1"
      sources."pathe-1.1.1"
      sources."perfect-debounce-1.0.0"
      sources."picomatch-2.3.1"
      (sources."pkg-types-1.0.3" // {
        dependencies = [
          sources."jsonc-parser-3.2.0"
        ];
      })
      sources."prompts-2.4.2"
      sources."queue-microtask-1.2.3"
      sources."rc9-2.1.1"
      sources."readdirp-3.6.0"
      sources."reusify-1.0.4"
      sources."run-parallel-1.2.0"
      sources."semver-7.5.4"
      sources."shebang-command-2.0.0"
      sources."shebang-regex-3.0.0"
      sources."sisteransi-1.0.5"
      sources."string-argv-0.3.2"
      sources."tar-6.2.0"
      sources."to-regex-range-5.0.1"
      sources."type-detect-4.0.8"
      sources."ufo-1.3.1"
      sources."vscode-jsonrpc-8.1.0"
      sources."vscode-languageserver-8.1.0"
      (sources."vscode-languageserver-protocol-3.17.3" // {
        dependencies = [
          sources."vscode-languageserver-types-3.17.3"
        ];
      })
      sources."vscode-languageserver-textdocument-1.0.11"
      sources."vscode-languageserver-types-3.17.5"
      sources."vscode-uri-2.1.2"
      sources."which-2.0.2"
      sources."yallist-4.0.0"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "A language server for emmet.io";
      homepage = "https://github.com/olrtg/emmet-language-server#readme";
      license = "MIT";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
}
