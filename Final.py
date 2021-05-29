import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import linear_kernel
from flask import Flask, request,jsonify

app = Flask(__name__)




product = pd.read_csv('Total Dataset.csv')

tfidf = TfidfVectorizer(stop_words='english')

product['About Product'] = product['About Product'].fillna('')

overview_matrix = tfidf.fit_transform(product['About Product'])

overview_matrix.shape

similarity_matrix = linear_kernel(overview_matrix,overview_matrix)

mapping = {}

    
for index, row in product.iterrows():
    mapping[index] = row.to_dict()
    #print(mapping)

mapping = list(mapping.values())


from csv import reader
# open file in read mode
with open('Total Dataset.csv', 'r',encoding="utf8") as read_obj:
    # pass the file object to reader() to get the reader object
    csv_reader = reader(read_obj)
    # Get all rows of csv from csv_reader object as list of tuples
    list_of_tuples = list(map(list, csv_reader))
    
    
    
dic2 = {}
   

#res = list(mapping.values()).index('DB Longboards CoreFlex Crossbow 41" Bamboo Fiberglass Longboard Complete')
#mapping = pd.Series(product.index,index = product['Product Name'])
#print(mapping)
@app.route('/api',methods=['GET'])
def recommend_products():
    #product_index = mapping[product_input]
    product_input = str(request.args['Query'])
    product_index = next((index for (index, d) in enumerate(mapping) if d["Product Name"] == product_input), None)

    #print(product_index)
    #get similarity values with other products
    #similarity_score is the list of index and similarity matrix
    similarity_score = list(enumerate(similarity_matrix[product_index]))
    #sort in descending order the similarity score of product inputted with all the other products
    similarity_score = sorted(similarity_score, key=lambda x: x[1], reverse=True)
    # Get the scores of the 15 most similar products. Ignore the first product.
    similarity_score = similarity_score[0:5]
    #return product names using the mapping series
    product_indices = [i[0] for i in similarity_score]
    

    #newmapping = {}

        
    for i, element in enumerate(product_indices):
        for  index, row in enumerate(list_of_tuples):
                if(element == index-1):
                    dic2[i] = row[1:]
    #print(mapping)

    #newmapping = list(newmapping.values())
    #print(type(newmapping))
    #print(type(jsonify(newmapping)))
    return jsonify(dic2)



@app.route('/all')
def display_products():
    
    d2 = {}
    for  i, row in enumerate(list_of_tuples):
        
        d2[i] = row[1:]
    return jsonify(d2)

if __name__ == '__main__':
    app.run(ssl_context='adhoc') 
    
#print(recommend_products('DB Longboards CoreFlex Crossbow 41" Bamboo Fiberglass Longboard Complete'))

