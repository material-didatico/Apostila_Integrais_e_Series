#------------------------------------------------------------------------------#

from pathlib import Path
import shutil as sh

#------------------------------------------------------------------------------#

title      = 'Materiais Didáticos para Integração e Séries'
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
page         = root / '_docs_md'
page_classes = page / 'classes'
page_exams   = page / 'exams'
index        = page / 'index.md'

tab = 4*' '

#------------------------------------------------------------------------------#
def folder_name(src: str) -> str:

    names = {
            'A Introducao' : 'A - Introdução',
            'B Integracao' : 'B - Integração',
            'C Areas'      : 'C - Áreas e Volumes',
            'D Tecnicas'   : 'D - Técnicas de Integração',
            'E Sequencias' : 'E - Sequências Numéricas',
            'F Series'     : 'F - Séries Numérias',
            'G Potencias'  : 'G - Séries de Potências',
            'H Taylor'     : 'H - Séries de Taylor',
            'I Usos'       : 'I - Usos das Séries de Taylor'
            }

    try:
        return names[src]

    except KeyError:
        return src


#------------------------------------------------------------------------------#
def pdf_name(src: str) -> str:

    names = {
        'Integracao e Series'                         : 'Integração e Séries',
        'A 01 Apresentacao'                           : 'A - 01 - Apresentação',
        'A 02 Metodo Matematico'                      : 'A - 02 - Método Matemático',
        'A 03 Funcoes'                                : 'A - 03 - Funções',
        'A 04 Limites'                                : 'A - 04 - Limites',
        'A 05 Derivadas'                              : 'A - 05 - Derivadas',
        'B 01 Integrais Indefinidas'                  : 'B - 01 - Integrais Indefinidas',
        'B 02 Integrais Definidas'                    : 'B - 02 - Integrais Definidas',
        'B 03 Teorema Valor Medio'                    : 'B - 03 - Teorema Valor Médio',
        'B 04 Teorema Fundamental Calculo I'          : 'B - 04 - Teorema Fundamental Cálculo I',
        'B 05 Teorema Fundamental Calculo II'         : 'B - 05 - Teorema Fundamental Cálculo II',
        'B 06 Integrais improprias'                   : 'B - 06 - Integrais impróprias',
        'C 01 Areas entre curvas'                     : 'C - 01 - Áreas entre curvas',
        'C 02 Volumes secoes transversais'            : 'C - 02 - Volumes seções transversais',
        'C 03 Volumes solidos revolucao'              : 'C - 03 - Volumes sólidos revolução',
        'C 04 Volumes cascas cilindricas'             : 'C - 04 - Volumes cascas cilíndricas',
        'D 01 Tecnicas integracao'                    : 'D - 01 - Técnicas integração',
        'D 02 Integracao por partes'                  : 'D - 02 - Integração por partes',
        'D 03 Integracao por substituicao'            : 'D - 03 - Integração por substituição',
        'D 04 Integrais trigonometricas 1'            : 'D - 04 - Integrais trigonométricas - 1',
        'D 05 Integrais trigonometricas 2'            : 'D - 05 - Integrais trigonométricas - 2',
        'D 06 Integrais trigonometricas 3'            : 'D - 06 - Integrais trigonométricas - 3',
        'D 07 Substituicao trigonometrica 1'          : 'D - 07 - Substituição trigonométrica - 1',
        'D 08 Substituicao trigonometrica 2'          : 'D - 08 - Substituição trigonométrica - 2',
        'D 09 Substituicao trigonometrica 3'          : 'D - 09 - Substituição trigonométrica - 3',
        'D 10 Fracoes parciais 1'                     : 'D - 10 - Frações parciais - 1',
        'D 11 Fracoes parciais 2'                     : 'D - 11 - Frações parciais - 2',
        'D 12 Fracoes parciais 3'                     : 'D - 12 - Frações parciais - 3',
        'D 13 Fracoes parciais 4'                     : 'D - 13 - Frações parciais - 4',
        'E 01 Sequencias numericas'                   : 'E - 01 - Sequências numéricas',
        'E 02 Sequencias numericas teoremas'          : 'E - 02 - Sequências numéricas - Teoremas',
        'F 01 Series numericas definicao'             : 'F - 01 - Séries numéricas definição',
        'F 02 Series numericas propriedades'          : 'F - 02 - Séries numéricas propriedades',
        'F 03 Series numericas exemplos'              : 'F - 03 - Séries numéricas exemplos',
        'F 04 Series numericas testes'                : 'F - 04 - Séries numéricas testes',
        'F 05 Series numericas teste interal'         : 'F - 05 - Séries numéricas teste da integral',
        'F 06 Series numericas teste comparacao'      : 'F - 06 - Séries numéricas teste da comparação',
        'F 07 Series numericas teste razao'           : 'F - 07 - Séries numéricas teste da razão',
        'F 08 Series numericas teste raiz'            : 'F - 08 - Séries numéricas teste da raiz',
        'F 09 Series numericas alternadas'            : 'F - 09 - Séries numéricas alternadas',
        'G 01 Series de Potencias Introducao'         : 'G - 01 - Séries de Potências - Introdução',
        'G 02 Series de Potencias Definicao'          : 'G - 02 - Séries de Potências - Definição',
        'G 03 Series de Potencias Convergencia'       : 'G - 03 - Séries de Potências - Convergência',
        'G 04 Series de Potencias Manipulacao'        : 'G - 04 - Séries de Potências - Manipulação',
        'H 01 Series de Taylor Introducao'            : 'H - 01 - Séries de Taylor Introdução',
        'H 02 Series de Taylor Serie Binomial'        : 'H - 02 - Séries de Taylor Série Binomial',
        'H 03 Convergencia das Series de Taylor'      : 'H - 03 - Convergência das Séries de Taylor',
        'I 01 Usos das Series de Taylor Euler'        : 'I - 01 - Usos das Séries de Taylor - Euler',
        'I 02 Usos das Series de Taylor Integrais'    : 'I - 02 - Usos das Séries de Taylor - Integrais',
        'I 03 Usos das Series de Taylor Limites'      : 'I - 03 - Usos das Séries de Taylor - Limites',
        'I 04 Usos das Series de Taylor ArcoTangente' : 'I - 04 - Usos das Séries de Taylor - ArcoTangente'
    }

    try:
        return names[src]

    except KeyError:
        return src


#------------------------------------------------------------------------------#
def cp_pdf(src: str, dest: str) -> None:

    for pdf in src.glob("*/*.pdf"):
        dest_pdf = dest / pdf.relative_to(src)
        dest_pdf.parent.mkdir(parents=True, exist_ok=True)
        sh.copy2(pdf, dest_pdf)


#------------------------------------------------------------------------------#
def mk_page() -> None:

    print('Resetting page folders...')
    sh.rmtree(page, ignore_errors=True)
    page.mkdir()

    if add_book:
        print('Copying booklet...')
        sh.copy(book, page)

    print('Copying handouts...')
    cp_pdf(classes, page_classes)

    print('Copying exams...')
    cp_pdf(exams, page_exams)


#------------------------------------------------------------------------------#
def write_pdf_link(f, file: Path, prefix: str = ''):
    text = file.name.replace('_', ' ').replace('-', ' ').replace('.pdf', '')
    text = pdf_name(text)
    f.write(f'{prefix}[[PDF]]({file}) {text}\n')


#------------------------------------------------------------------------------#
def mk_index() -> None:
    with index.open("w", encoding="utf-8") as f:

        f.write(f"# {title}\n\nMateriais para a disciplina {discipline}\n")

        if add_book:

            f.write("\n??? Apostila\n")
            
            for file in sorted(page.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), tab)

        f.write('\n??? "Apresentações das aulas"\n')
        
        for folder in sorted(page_classes.glob("*")):
        
            name = folder.name.replace('_', ' ').replace('-', ' ')
            name = folder_name(name)
            
            f.write(f'\n{tab}??? abstract "{name}"\n')
            
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), f'{tab}{tab}- ')

        f.write('\n??? "Avaliações anteriores"\n')
        
        for folder in sorted(page_exams.glob("*")):
        
            name = folder.name.replace('_', ' ').replace('-', ' ')
            
            f.write(f'\n{tab}??? abstract "{name}"\n')
            
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), f'{tab}{tab}- ')


#------------------------------------------------------------------------------#
if __name__ == '__main__':

    mk_page ()
    mk_index()

#------------------------------------------------------------------------------#
