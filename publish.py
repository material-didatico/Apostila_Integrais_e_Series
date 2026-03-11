#------------------------------------------------------------------------------#

from pathlib  import Path
from datetime import datetime
from zoneinfo import ZoneInfo
import shutil as sh

#------------------------------------------------------------------------------#

title      = 'Materiais Didáticos para IS - Integração e Séries'
discipline = 'Integração e Séries'
book_name  = 'Integracao_e_Series.pdf'
add_book   = True

#------------------------------------------------------------------------------#

# Sources
root  = Path(__file__).parent
book  = root / '1-book' / book_name
pres  = root / '2-classes' / 'pdf' / '1-pres'
hand  = root / '2-classes' / 'pdf' / '2-hand'
exams = root / '3-exams'

# Destiny
page       = root / '_docs_md'
page_pres  = page / 'pres'
page_hand  = page / 'hand'
page_exams = page / 'exams'
index      = page / 'index.md'

tab = 4*' '

#------------------------------------------------------------------------------#
def folder_name(name: str) -> str:

    names = {
            'A-Introducao' : 'A - Introdução',
            'B-Integracao' : 'B - Integração',
            'C-Areas'      : 'C - Áreas e Volumes',
            'D-Tecnicas'   : 'D - Técnicas de Integração',
            'E-Sequencias' : 'E - Sequências Numéricas',
            'F-Series'     : 'F - Séries Numérias',
            'G-Potencias'  : 'G - Séries de Potências',
            'H-Taylor'     : 'H - Séries de Taylor',
            'I-Usos'       : 'I - Usos das Séries de Taylor'
            }

    try:
        return names[name]

    except KeyError:
        return name.replace('_', ' ').replace('-', ' ')


#------------------------------------------------------------------------------#
def pdf_name(name: str) -> str:

    names = {
        'Integracao_e_Series'                         : 'Integração e Séries',
        'A-01-Apresentacao'                           : 'A - 01 - Apresentação',
        'A-02-Metodo_Matematico'                      : 'A - 02 - Método Matemático',
        'A-03-Funcoes'                                : 'A - 03 - Funções',
        'A-04-Limites'                                : 'A - 04 - Limites',
        'A-05-Derivadas'                              : 'A - 05 - Derivadas',
        'B-01-Integrais_Indefinidas'                  : 'B - 01 - Integrais Indefinidas',
        'B-02-Integrais_Definidas'                    : 'B - 02 - Integrais Definidas',
        'B-03-Teorema_Valor_Medio'                    : 'B - 03 - Teorema Valor Médio',
        'B-04-Teorema_Fundamental_Calculo-I'          : 'B - 04 - Teorema Fundamental Cálculo I',
        'B-05-Teorema_Fundamental_Calculo-II'         : 'B - 05 - Teorema Fundamental Cálculo II',
        'B-06-Integrais_improprias'                   : 'B - 06 - Integrais impróprias',
        'C-01-Areas_entre_curvas'                     : 'C - 01 - Áreas entre curvas',
        'C-02-Volumes_secoes_transversais'            : 'C - 02 - Volumes seções transversais',
        'C-03-Volumes_solidos_revolucao'              : 'C - 03 - Volumes sólidos revolução',
        'C-04-Volumes_cascas_cilindricas'             : 'C - 04 - Volumes cascas cilíndricas',
        'D-01-Tecnicas_integracao'                    : 'D - 01 - Técnicas integração',
        'D-02-Integracao_por_partes'                  : 'D - 02 - Integração por partes',
        'D-03-Integracao_por_substituicao'            : 'D - 03 - Integração por substituição',
        'D-04-Integrais_trigonometricas-1'            : 'D - 04 - Integrais trigonométricas - 1',
        'D-05-Integrais_trigonometricas-2'            : 'D - 05 - Integrais trigonométricas - 2',
        'D-06-Integrais_trigonometricas-3'            : 'D - 06 - Integrais trigonométricas - 3',
        'D-07-Substituicao_trigonometrica-1'          : 'D - 07 - Substituição trigonométrica - 1',
        'D-08-Substituicao_trigonometrica-2'          : 'D - 08 - Substituição trigonométrica - 2',
        'D-09-Substituicao_trigonometrica-3'          : 'D - 09 - Substituição trigonométrica - 3',
        'D-10-Fracoes_parciais-1'                     : 'D - 10 - Frações parciais - 1',
        'D-11-Fracoes_parciais-2'                     : 'D - 11 - Frações parciais - 2',
        'D-12-Fracoes_parciais-3'                     : 'D - 12 - Frações parciais - 3',
        'D-13-Fracoes_parciais-4'                     : 'D - 13 - Frações parciais - 4',
        'E-01-Sequencias_numericas'                   : 'E - 01 - Sequências numéricas',
        'E-02-Sequencias_numericas_teoremas'          : 'E - 02 - Sequências numéricas - Teoremas',
        'F-01-Series_numericas_definicao'             : 'F - 01 - Séries numéricas definição',
        'F-02-Series_numericas_propriedades'          : 'F - 02 - Séries numéricas propriedades',
        'F-03-Series_numericas_exemplos'              : 'F - 03 - Séries numéricas exemplos',
        'F-04-Series_numericas_testes'                : 'F - 04 - Séries numéricas testes',
        'F-05-Series_numericas_teste_integral'        : 'F - 05 - Séries numéricas teste da integral',
        'F-06-Series_numericas_teste_comparacao'      : 'F - 06 - Séries numéricas teste da comparação',
        'F-07-Series_numericas_teste_razao'           : 'F - 07 - Séries numéricas teste da razão',
        'F-08-Series_numericas_teste_raiz'            : 'F - 08 - Séries numéricas teste da raiz',
        'F-09-Series_numericas_alternadas'            : 'F - 09 - Séries numéricas alternadas',
        'G-01-Series_de_Potencias-Introducao'         : 'G - 01 - Séries de Potências - Introdução',
        'G-02-Series_de_Potencias-Definicao'          : 'G - 02 - Séries de Potências - Definição',
        'G-03-Series_de_Potencias-Convergencia'       : 'G - 03 - Séries de Potências - Convergência',
        'G-04-Series_de_Potencias-Manipulacao'        : 'G - 04 - Séries de Potências - Manipulação',
        'H-01-Series_de_Taylor-Introducao'            : 'H - 01 - Séries de Taylor Introdução',
        'H-02-Series_de_Taylor-Serie_Binomial'        : 'H - 02 - Séries de Taylor Série Binomial',
        'H-03-Convergencia_das_Series_de_Taylor'      : 'H - 03 - Convergência das Séries de Taylor',
        'I-01-Usos_das_Series_de_Taylor-Euler'        : 'I - 01 - Usos das Séries de Taylor - Euler',
        'I-02-Usos_das_Series_de_Taylor-Integrais'    : 'I - 02 - Usos das Séries de Taylor - Integrais',
        'I-03-Usos_das_Series_de_Taylor-Limites'      : 'I - 03 - Usos das Séries de Taylor - Limites',
        'I-04-Usos_das_Series_de_Taylor-ArcoTangente' : 'I - 04 - Usos das Séries de Taylor - ArcoTangente'
    }

    name = name.replace('pres_', '').replace('.pdf', '')

    try:
        return names[name]

    except KeyError:
        print(name)
        return name.replace('_', ' ').replace('-', ' ')


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

    print('Copying presentations...')
    cp_pdf(pres, page_pres)

    print('Copying handouts...')
    cp_pdf(hand, page_hand)

    print('Copying exams...')
    cp_pdf(exams, page_exams)


#------------------------------------------------------------------------------#
def write_pdf_link(f, file: Path, prefix: str = ''):
    name = pdf_name(file.name)
    f.write(f'{prefix}[[ PDF ]]({file}) {name}\n')


#------------------------------------------------------------------------------#
def mk_index() -> None:
    with index.open("w", encoding="utf-8") as f:

        # Header

        now = datetime.now(ZoneInfo("America/Sao_Paulo"))

        f.write(f"# {title}\n\n")
        f.write(now.strftime("Última atualização: %Y-%m-%d %H:%M:%S\n\n"))
        f.write(f"Materiais para a disciplina {discipline}\n\n")

        # Link to Book

        if add_book:
            f.write("\n??? Apostila\n")
            for file in sorted(page.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), tab)

        # Links to presentations

        f.write('\n??? "Apresentações das aulas"\n')
        for folder in sorted(page_hand.glob("*")):
            name = folder_name(folder.name)
            f.write(f'\n{tab}??? abstract "{name}"\n')
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), f'{tab}{tab}- ')

        # Links to presentations - passo a passo

        f.write('\n??? "Apresentações das aulas - passo a passo"\n')
        for folder in sorted(page_pres.glob("*")):
            name = folder_name(folder.name)
            f.write(f'\n{tab}??? abstract "{name}"\n')
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), f'{tab}{tab}- ')

        # Links to previous tests

        f.write('\n??? "Avaliações anteriores"\n')
        for folder in sorted(page_exams.glob("*")):
            name = folder_name(folder.name)
            f.write(f'\n{tab}??? abstract "{name}"\n')
            for file in sorted(folder.glob("*.pdf")):
                write_pdf_link(f, file.relative_to(page), f'{tab}{tab}- ')


#------------------------------------------------------------------------------#
if __name__ == '__main__':

    mk_page ()
    mk_index()

#------------------------------------------------------------------------------#
