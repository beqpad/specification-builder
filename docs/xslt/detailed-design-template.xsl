<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>
  
  <xsl:template match="/detailed_design_specification">
    <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="metadata/project_name"/> - 詳細設計書</title>
        <link rel="stylesheet" type="text/css" href="../css/specifications.css"/>
      </head>
      <body>
        <div class="container">
          <div class="header">
            <h1><xsl:value-of select="metadata/project_name"/></h1>
            <div class="subtitle">詳細設計書</div>
          </div>

          <div class="metadata">
            <h2>ドキュメント情報</h2>
            <div class="metadata-grid">
              <div class="metadata-item">
                <span class="metadata-label">プロジェクト名</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/project_name != ''">
                      <xsl:value-of select="metadata/project_name"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
              <div class="metadata-item">
                <span class="metadata-label">バージョン</span>
                <div class="metadata-value">
                  <xsl:choose>
                    <xsl:when test="metadata/version != ''">
                      <xsl:value-of select="metadata/version"/>
                    </xsl:when>
                    <xsl:otherwise><span class="empty-value"></span></xsl:otherwise>
                  </xsl:choose>
                </div>
              </div>
            </div>
          </div>

          <div class="content">
            <xsl:if test="module_design/module">
              <div class="section">
                <h2 class="section-header">モジュール設計</h2>
                <div class="section-content">
                  <ul class="item-list">
                    <xsl:for-each select="module_design/module">
                      <li class="item">
                        <div class="item-header">
                          <span class="item-id"><xsl:value-of select="@id"/></span>
                          <xsl:value-of select="name"/>
                        </div>
                        <div class="item-content">
                          <p><strong>説明:</strong> <xsl:value-of select="description"/></p>
                          <p><strong>目的:</strong> <xsl:value-of select="purpose"/></p>
                          <p><strong>場所:</strong> <xsl:value-of select="location"/></p>
                        </div>
                      </li>
                    </xsl:for-each>
                  </ul>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="database_design/physical_model/table">
              <div class="section">
                <h2 class="section-header">データベース設計</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">物理モデル</h3>
                    <ul class="item-list">
                      <xsl:for-each select="database_design/physical_model/table">
                        <li class="item">
                          <div class="item-header">
                            <span class="item-id"><xsl:value-of select="@id"/></span>
                            <xsl:value-of select="name"/>
                          </div>
                          <div class="item-content">
                            <p><xsl:value-of select="description"/></p>
                          </div>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </div>
                </div>
              </div>
            </xsl:if>

            <xsl:if test="api_design/rest_endpoints/endpoint">
              <div class="section">
                <h2 class="section-header">API設計</h2>
                <div class="section-content">
                  <div class="subsection">
                    <h3 class="subsection-header">RESTエンドポイント</h3>
                    <ul class="item-list">
                      <xsl:for-each select="api_design/rest_endpoints/endpoint">
                        <li class="item">
                          <div class="item-header">
                            <span class="item-id"><xsl:value-of select="@id"/></span>
                            <xsl:value-of select="method"/> <xsl:value-of select="path"/>
                          </div>
                          <div class="item-content">
                            <p><xsl:value-of select="description"/></p>
                          </div>
                        </li>
                      </xsl:for-each>
                    </ul>
                  </div>
                </div>
              </div>
            </xsl:if>
          </div>

          <div class="navigation">
            <div class="nav-links">
              <a href="../basic-design/index.html" class="nav-link">← 基本設計</a>
              <a href="../index.html" class="nav-link">目次</a>
              <a href="../development/index.html" class="nav-link">開発 →</a>
            </div>
          </div>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>