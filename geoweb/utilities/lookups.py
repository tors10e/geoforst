import datetime

def get_years_list(yearsInFuture=10, yearsInPast=10):
    """Returns a list of years for lookups"""
    # Adding 10 years to allow choices ten years 
    # in the future.
    currentYear = datetime.datetime.now().year
    year = currentYear+yearsInFuture
    numberOfYears = yearsInPast+yearsInFuture
    yearList=[]
    i=0
    while i < numberOfYears:
        yearList.append((year,year))
        year = year-1
        i = i+1
    return yearList
    