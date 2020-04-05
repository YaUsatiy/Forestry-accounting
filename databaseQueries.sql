CREATE TABLE category (
	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,
	CONSTRAINT pk_category_id PRIMARY KEY (id) 
);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),	
	CONSTRAINT pk_user_id PRIMARY KEY(id)
);


CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	
);

CREATE TABLE address (
	id IDENTITY,
	user_id int,
	address_line_one VARCHAR(100),
	address_line_two VARCHAR(100),
	city VARCHAR(20),
	state VARCHAR(20),
	country VARCHAR(20),
	postal_code VARCHAR(10),
	is_billing BOOLEAN,
	is_shipping BOOLEAN,
	CONSTRAINT fk_address_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_address_id PRIMARY KEY (id)
);

CREATE TABLE cart (
	id IDENTITY,
	user_id int,
	grand_total DECIMAL(10,2),
	cart_lines int,
	CONSTRAINT fk_cart_user_id FOREIGN KEY (user_id ) REFERENCES user_detail (id),
	CONSTRAINT pk_cart_id PRIMARY KEY (id)
);


-- adding three categories
INSERT INTO category (name, description,image_url,is_active) VALUES ('Pine', 'This is description for pine category!', 'CAT_1.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Oak', 'This is description for oak category!', 'CAT_2.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Spruce', 'This is description for spruce category!', 'CAT_3.png', true);
INSERT INTO category (name, description,image_url,is_active) VALUES ('Maple', 'This is description for maple category!', 'CAT_4.png', true);

-- adding loggers
INSERT INTO LOGGER (name, description, code, company, views, birth_city, birth_year, seniority, marital_status) VALUES ('Antony Borisenko', 'Best logger in the world', 'LOGABC123DEFX', 'Green Forest', 0, 'Minsk', 1999, 5, 'not married');
INSERT INTO LOGGER (name, description, code, company, views, birth_city, birth_year, seniority, marital_status) VALUES ('Antony Mitrofanov', 'Best logger in the Belarus', 'LOGDEF123DEFX', 'Best wood', 0, 'Minsk', 2000, 3, 'married');
INSERT INTO LOGGER (name, description, code, company, views, birth_city, birth_year, seniority, marital_status) VALUES ('Filya Markovich', 'This man is a master in the sphere', 'LOGPQR123WGTX', 'Company', 0, 'Minsk', 2000, 7, 'divorced');

-- adding three users
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Admin', 'Admin', 'ADMIN', true, '$2a$06$ORtBskA2g5Wg0HDgRE5ZsOQNDHUZSdpJqJ2.PGXv0mKyEvLnKP7SW', 'ad@gmail.com', '8888888');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Vanya', 'Luk', 'SUPPLIER', true, '$2a$06$bzYMivkRjSxTK2LPD8W4te6jjJa795OwJR1Of5n95myFsu3hgUnm6', 'vl@gmail.com', '9999999');
INSERT INTO user_detail 
(first_name, last_name, role, enabled, password, email, contact_number) 
VALUES ('Toha', 'Mitr', 'USER', true, '$2a$06$i1dLNlXj2uY.UBIb9kUcAOxCigGHUZRKBtpRlmNtL5xtgD6bcVNOK', 'tm@gmail.com', '7777777');

-- adding five products
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'Common pine', 'Scots pine (Pinus sylvestris) is a species of pine that is native to Eurasia, ranging from Western Europe to Eastern Siberia, south to the Caucasus Mountains and Anatolia, and north to well inside the Arctic Circle in Fennoscandia. In the north of its range, it occurs from sea level to 1,000 m (3,300 ft), while in the south of its range it is a mountain tree, growing at 1,200–2,600 m (3,900–8,500 ft) altitude. It is readily identified by its combination of fairly short, blue-green leaves and orange-red bark. The species is mainly found on poorer, sandy soils, rocky outcrops, peat bogs or close to the forest limit. On fertile sites, Scots pine is out-competed by other, usually spruce or broad-leaved tree species. It is the national tree of Scotland.', 180, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDDEF123DEFX', 'Mountain pine', 'Pinus pungens is a tree of modest size (6–12 m), and has a rounded, irregular shape. The needles are in bundles of two, occasionally three, yellow-green to mid green, fairly stout, and 4–7 cm long. The pollen is released early compared to other pines in the area to minimize hybridization. The cones are very short-stalked (almost sessile), ovoid, pale pinkish to yellowish buff, and 4–9 cm long; each scale bears a stout, sharp spine 4–10 mm long. Sapling trees can bear cones in a little as 5 years. Buds ovoid to cylindric, red-brown, 0.6-0.9 cm, resinous. This pine prefers dry conditions and is mostly found on rocky slopes, preferring higher elevations, from 300–1760 m altitude. It commonly grows as single scattered trees or small groves, not in large forests like most other pines, and needs periodic disturbances for seedling establishment.', 320, 2, true, 1, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDPQR123WGTX', 'Siberian pine', 'Pinus sibirica is a member of the white pine group, Pinus subgenus Strobus, and like all members of that group, the leaves are in fascicles (bundles) of five, with a deciduous sheath. They are 5–10 cm long. Siberian pine cones are 5–9 cm long. The 9–12 mm long seeds have only a vestigial wing and are dispersed by spotted nutcrackers. Siberian pine is treated as a variety or subspecies of the very similar Swiss pine by some botanists. It differs in having slightly larger cones, and needles with three resin canals instead of two in Swiss pine. Like other European and Asian white pines, Siberian pine is very resistant to white pine blister rust (Cronartium ribicola). This fungal disease was accidentally introduced from Europe into North America, where it has caused severe mortality in the American native white pines in many areas, notably the closely related whitebark pine.', 570, 5, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDMNO123PQRX', 'Black pine', 'Pinus nigra is a tree of the Mediterranean forests, woodlands, and scrub biome. The majority of the range is in Turkey. It is found in the higher elevations of the South Apennine mixed montane forests ecoregion in southern Italy and the Tyrrhenian-Adriatic sclerophyllous and mixed forests ecoregion in Sicily. There are remnant populations in the Mediterranean conifer and mixed forests ecoregion, and in the higher Atlas Mountains in Morocco and Algeria. It is found at elevations ranging from sea level to 2,000 metres (6,600 ft), most commonly from 250–1,600 metres (820–5,250 ft). Several of the varieties have distinct English names. It has naturalized in parts of the midwestern states of the U.S, normally south of the normal native ranges of native pines.', 990, 3, true, 1, 2, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABCXYZDEFX', 'English oak', 'It is a long-lived tree, with a large wide spreading crown of rugged branches. While it may naturally live to an age of a few centuries, many of the oldest trees are pollarded or coppiced, both pruning techniques that extend the tree''s potential lifespan, if not its health. Two individuals of notable longevity are the Stelmužė Oak in Lithuania and the Granit Oak in Bulgaria, which are believed to be more than 1500 years old, possibly making them the oldest oaks in Europe; another specimen, called the ''Kongeegen'' (''Kings Oak''), estimated to be about 1200 years old, grows in Jaegerspris, Denmark. Yet another can be found in Kvilleken, Sweden, that is over 1000 years old and 14 metres (46 ft) around.[8] Of maiden (not pollarded) specimens, one of the oldest is the great oak of Ivenack, Germany. Tree-ring research of this tree and other oaks nearby gives an estimated age of 700 to 800 years.', 700, 5, true, 2, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABDXYZDEFX', 'Spanish oak', 'The pin oak is also well adapted to life in Australia (where it has been introduced), and is quite widespread across the Australian continent, especially in the cooler southern States such as Victoria and New South Wales. It is also well adapted to life in South Africa and Argentina, especially in the Río de la Plata region. Pin oaks grow primarily on level or nearly level, poorly drained, alluvial floodplain and river-bottom soils with high clay content. They are usually found on sites that flood intermittently during the dormant season, but do not ordinarily flood during the growing season. They do not grow on the lowest, most poorly drained sites that may be covered with standing water through much of the growing season. However, they do grow extensively on poorly drained upland "pin oak flats" on the glacial till plains of southwestern Ohio, southern Illinois and Indiana, and northern Missouri.', 700, 5, true, 2, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABEXYZDEFX', 'Chestnut-leaved oak', 'Chestnut-leaved oak is a deciduous tree growing < 35 m tall, with a trunk < 2.5 m diameter (exceptionally up to 50 m tall with a trunk < 3.5 m diameter). The leaves are 10–20 cm long and 3–5 cm wide, with 10–15 small, regular triangular lobes on each side. The flowers are wind-pollinated catkins; the fruit is an acorn, maturing about 18 months after pollination, 2–3 cm long and 1.5–2 cm broad, bicoloured with an orange basal half grading to a green-brown tip; the acorn cup is 2 cm deep, densely covered in soft 4–8 mm long ''mossy'' bristles. The acorns are very bitter, but are eaten by jays and pigeons; squirrels usually only eat them when other food sources have been exhausted.', 700, 5, true, 2, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABBXYZDEFX', 'European spruce', 'Norway spruce is a large, fast-growing evergreen coniferous tree growing 35–55 m (115–180 ft) tall and with a trunk diameter of 1 to 1.5 m (39 to 59 in). It can grow fast when young, up to 1 m (3 ft) per year for the first 25 years under good conditions, but becomes slower once over 20 m (65 ft) tall. The shoots are orange-brown and glabrous (hairless). The leaves are needle-like with blunt tips, 12–24 mm (15⁄32–15⁄16 in) long, quadrangular in cross-section (not flattened), and dark green on all four sides with inconspicuous stomatal lines. The seed cones are 9–17 cm (3 1⁄2–6 3⁄4 in) long (the longest of any spruce), and have bluntly to sharply triangular-pointed scale tips. They are green or reddish, maturing brown 5–7 months after pollination. The seeds are black, 4–5 mm (5⁄32–3⁄16 in) long, with a pale brown 15-millimetre (5⁄8-inch) wing.', 700, 5, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDBBBXYZDEFX', 'White spruce', 'The white spruce is a large coniferous evergreen tree which grows normally to 15 to 30 m (50 to 100 ft) tall, but can grow up to 40 m (130 ft) tall with a trunk diameter of up to 1 m (3.3 ft). The bark is thin and scaly, flaking off in small circular plates 5 to 10 cm (2 to 4 in) across. The crown is narrow – conic in young trees, becoming cylindric in older trees. The shoots are pale buff-brown, glabrous (hairless) in the east of the range, but often pubescent in the west, and with prominent pulvini. The leaves are needle-like, 12 to 20 mm (1⁄2 to 13⁄16 in) long, rhombic (diamond-shaped) in cross-section, glaucous blue-green above (hence glauca) with several thin lines of stomata, and blue-white below with two broad bands of stomata.', 700, 5, true, 3, 3, 0, 0 );
INSERT INTO product (code, name, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDCBBXYZDEFX', 'Norway maple', 'The Norway maple is a member (and is the type species) of the section Platanoidea Pax, characterised by flattened, disc-shaped seeds and the shoots and leaves containing milky sap. Other related species in this section include Acer campestre (field maple), Acer cappadocicum (Cappadocian maple), Acer lobelii (Lobels maple), and Acer truncatum (Shandong maple). From the field maple, the Norway maple is distinguished by its larger leaves with pointed, not blunt, lobes, and from the other species by the presence of one or more teeth on all of the lobes.', 700, 5, true, 4, 3, 0, 0 );