#!/bin/bash
echo "Run"
mkdir config
mkdir controllers
mkdir models
mkdir routes
touch ./config/database.js
touch ./models/productModel.js
touch ./index.js
touch ./routes/index.js
touch ./controllers/Products.js
echo "import { Sequelize } from 'sequelize';
 
const db = new Sequelize('ki406', 'root', 'HardPlay12', {
    host: 'localhost',
    dialect: 'mysql'
});
 
export default db;" >./config/database.js

echo 'import Product from "../models/productModel.js";
 
export const getAllProducts = async (req, res) => {
    try {
        const products = await Product.findAll();
        res.json(products);
    } catch (error) {
        res.json({ message: error.message });
    }  
}
 
export const getProductById = async (req, res) => {
    try {
        const product = await Product.findAll({
            where: {
                id: req.params.id
            }
        });
        res.json(product[0]);
    } catch (error) {
        res.json({ message: error.message });
    }  
}
 
export const createProduct = async (req, res) => {
    try {
        await Product.create(req.body);
        res.json({
            "message": "Product Created"
        });
    } catch (error) {
        res.json({ message: error.message });
    }  
}
 
export const updateProduct = async (req, res) => {
    try {
        await Product.update(req.body, {
            where: {
                id: req.params.id
            }
        });
        res.json({
            "message": "Product Updated"
        });
    } catch (error) {
        res.json({ message: error.message });
    }  
}
 
export const deleteProduct = async (req, res) => {
    try {
        await Product.destroy({
            where: {
                id: req.params.id
            }
        });
        res.json({
            "message": "Product Deleted"
        });
    } catch (error) {
        res.json({ message: error.message });
    }  
}' >./controllers/Products.js

