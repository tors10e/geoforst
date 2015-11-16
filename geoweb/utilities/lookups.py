import datetime

def get_years_list(numberOfYears=10):
    year = datetime.datetime.now().year
    yearList=[]
    i=0
    while i < numberOfYears:
        yearList.append((year,year))
        year = year-1
        i = i+1
    return yearList
    