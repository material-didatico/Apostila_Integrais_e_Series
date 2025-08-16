#------------------------------------------------------------------------------#

from pathlib import Path
import shutil as sh

#------------------------------------------------------------------------------#

title      = 'Materiais de IS'
discipline = 'Integração e Séries'
book_name  = 'Integracao_e_Series.pdf'
add_book   = True

#------------------------------------------------------------------------------#

# Sources
root = Path(__file__).parent
book    = root / '1-book' / book_name
classes = root / '2-classes' / 'pdf' / '2-hand'
exams   = root / '3-exams'

# Destiny
docs         = root / '_docs'
docs_classes = docs / 'classes'
docs_exams   = docs / 'exams'
index        = docs / "index.md"


#------------------------------------------------------------------------------#
def cp_pdf(src: str, dest: str) -> None:

    for pdf in src.glob("*/*.pdf"):
        dest_pdf = dest / pdf.relative_to(src)
        dest_pdf.parent.mkdir(parents=True, exist_ok=True)
        sh.copy2(pdf, dest_pdf)


#------------------------------------------------------------------------------#
def mk_docs() -> None:

    print('Resetting docs folder...')
    sh.rmtree(docs, ignore_errors=True)
    docs.mkdir()

    if add_book:
        print('Coping booklet...')
        sh.copy(book, docs)

    print('Coping handouts...')
    cp_pdf(classes, docs_classes)

    print('Coping exams...')
    cp_pdf(exams, docs_exams)


#------------------------------------------------------------------------------#
def write_pdf_link(f, file: Path, prefix: str = ''):
    text = file.name.replace('_', ' ').replace('-', ' ').replace('.pdf', '')
    f.write(f'{prefix}[{text} [PDF]]({file})\n')


#------------------------------------------------------------------------------#
def mk_index() -> None:
    with index.open("w", encoding="utf-8") as f:

        f.write(f"# {title}\n\nMateriais para a disciplina {discipline}\n")

        if add_book:
            f.write("\n\n## Apostila\n\n")
            for file in sorted(docs.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(docs))

        f.write('\n\n## Apresentações das Aulas\n\n')
        for folder in sorted(docs_classes.glob("*")):
            f.write(f"\n### {folder.name.replace('_', ' ')}\n\n")
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(docs), '- ')

        f.write('\n\n## Avaliações anteriores\n')
        for folder in sorted(docs_exams.glob("*")):
            f.write(f"\n### {folder.name.replace('_', ' ')}\n\n")
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(docs), '- ')


#------------------------------------------------------------------------------#
if __name__ == '__main__':

    mk_docs ()
    mk_index()

#------------------------------------------------------------------------------#
