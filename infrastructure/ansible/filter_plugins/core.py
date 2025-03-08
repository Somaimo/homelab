# Filter that creates correctly quoted entries ifor lists.
# The integrated quote function does not quote IP Addresses and this
# causes problems with step ca config files (based on json).
def wrap(list):
    return [ '"' + x + '"' for x in list]

class FilterModule(object):
    def filters(self):
        return {
            'wrap': wrap
        }
